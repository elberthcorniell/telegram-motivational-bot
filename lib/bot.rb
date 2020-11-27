# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Layout/LineLength
# rubocop:disable Lint/ReturnInVoidContext
# rubocop:disable Metrics/MethodLength
# rubocop:disable Style/ClassVars

require_relative './quotes'
require 'telegram/bot'
require 'json'

class TelegramBot
  attr_reader :chats

  @token = nil

  def initialize(default_chats = [], testing = false)
    @@quoter = Quotes.new
    @chats = default_chats
    file = File.read('./config.json')
    data = JSON.parse(file)
    @token = data['telegram_bot_api']
    return true if testing

    Telegram::Bot::Client.run(@token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          text = ''
          if !subscribed?(message.chat.id)
            text = "Hello, #{message.from.first_name}, I know sometimes is hard to keed your motivation. I'm here to help you, i'll send you a motivational quote everyday. if you want a quote just ask for it typing /quote. Else if you feel your motivation will never go down and don't need me anymore you can type /stop and I will understand you."
          else
            text = "Hello, #{message.from.first_name}. I'm happy to see you here and I hope my quotes are helping you."
          end
          chats.push(message.chat.id) if chats.none? message.chat.id
          bot.api.send_message(chat_id: message.chat.id, text: text)
        when '/quote'
          quote = @@quoter.get
          bot.api.send_message(chat_id: message.chat.id, text: "#{quote['text']}\ \n- #{quote['author']}")
        when '/stop'
          end_subscription message.chat.id if subscribed? message.chat.id
          bot.api.send_message(chat_id: message.chat.id, text: "Good bye my friend!\nIf you need me again hust type /start")
        else
          bot.api.send_message(chat_id: message.chat.id, text: 'I just recognize /start, /quote and /stop commands')
        end
      end
    end
  end

  def broadcast
    raise ArgumentError if chats.empty?

    quote = @@quoter.get
    Telegram::Bot::Client.run(@token) do |bot|
      chats.each do |id|
        yield(id) if block_given?
        bot.api.send_message(chat_id: id, text: "#{quote['text']}\ \n- #{quote['author']}")
      end
    end
    true
  end

  def subscribed?(chat_id = nil)
    chats.each_with_index do |id, index|
      return index if chat_id == id
    end
    false
  end

  def end_subscription(chat_id = nil)
    subscribed = subscribed?(chat_id)
    raise ArgumentError unless subscribed

    chats.delete_at(subscribed)
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Layout/LineLength
# rubocop:enable Lint/ReturnInVoidContext
# rubocop:enable Metrics/MethodLength
# rubocop:enable Style/ClassVars
