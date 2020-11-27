# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Style/ClassVar

require_relative './quotes'
require 'telegram/bot'
require 'json'

class TelegramBot
    @chats = nil
    @token = nil
    def initialize
        @@quoter = Quotes.new
        @chats = []
        file = File.read('./config.json')
        data = JSON.parse(file)
        @token = data["telegram_bot_api"]
        Telegram::Bot::Client.run(@token) do |bot|
            bot.listen do |message|
                case message.text
                when '/start'
                    text = ''
                    if !subscribed?(message.chat.id)
                        text = "Hello, #{message.from.first_name}, I know sometimes is hard to keed your motivation. I'm here to help you, i'll send you a motivational quote everyday. if you want a quote just ask for it typing \"/quote\". Else if you feel your motivation will never go down and don't need me anymore you can type \"/stop\" and I will understand you."
                    else
                        text = "Hello, #{message.from.first_name}. I'm happy to see you here and I hope my quotes are helping you."
                    end
                    @chats.push(message.chat.id) if !@chats.any? message.chat.id
                    bot.api.send_message(chat_id: message.chat.id, text: text)
                when '/quote'
                    quote = @@quoter.get
                    bot.api.send_message(chat_id: message.chat.id, text: "\"#{quote["text"]}\"\ - #{quote["author"]}")
                when '/stop'
                    end_subscription message.chat.id
                    bot.api.send_message(chat_id: message.chat.id, text: "Good bye my friend!\nIf you need me again hust type \"/start\"")
                else
                    bot.api.send_message(chat_id: message.chat.id, text: "I just recognize \"/start\", \"/quote\" and \"/stop\" commands")
                end
            end
        end
    end

    def broadcast
        quote = @@quoter.get
        Telegram::Bot::Client.run(@token) do |bot|
            @chats.each do |id|
                bot.api.send_message(chat_id: id, text: "\"#{quote["text"]}\"\ - #{quote["author"]}")
            end
        end
    end

    def subscribed?(chat_id = nil)
        @chats.each_with_index do |id, index| 
            if chat_id == id
                return index
            end
        end
        false
    end

    def end_subscription(chat_id = nil)
        subscribed = subscribed?(chat_id)
        @chats.delete_at(subscribed) if subscribed != false
    end 

end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Style/ClassVars