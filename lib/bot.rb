require 'telegram/bot'
require 'json'

class TelegramBot
    def initialize
        file = File.read('./config.json')
        data = JSON.parse(file)
        token = data["telegram_bot_api"]
        puts token
    end
end