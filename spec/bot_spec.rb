require_relative '../lib/bot'

describe 'Telegram Bot' do
  let(:chat_id) { '665821024' }
  let(:bot) { TelegramBot.new [chat_id], testing: true }

  describe 'initialize' do
    it 'Successfully starts a Telegram bot with empty chats if no parameter is given' do
      bot1 = TelegramBot.new [], testing: true
      expect(bot1.chats.empty?).to_not eql false
    end
    it 'Successfully starts a Telegram bot with the given parameter' do
      expect(bot.chats).to eql [chat_id]
    end
    it 'Successfully starts a Telegram bot with non empty chats if a parameter is given' do
      expect(bot.chats.empty?).to_not eql true
    end
    it 'Successfully assigns an Array to the chats atribute' do
      expect(bot.chats.is_a?(Array)).to eql true
    end
  end
end
