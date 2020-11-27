require 'telegram/bot'
require 'json'

class TelegramBot
    def initialize
        file = File.read('./config.json')
        data = JSON.parse(file)
        token = data["telegram_bot_api"]

        Telegram::Bot::Client.run(token) do |bot|
            bot.listen do |message|
                case message.text
                when '/start'
                    bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}, 
                    I know sometimes is hard to keed your motivation. I'm here to help you, 
                    i'll send you a motivational quote everyday. if you want a quote just ask for it typing \"/quote\". 
                    Else if you feel your motivation will never go down and don'\t need me anymore you can type \"/stop\" 
                    and I will understand you.")
                
            end
          end

    end
end