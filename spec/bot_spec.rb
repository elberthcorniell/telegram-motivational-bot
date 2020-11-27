require_relative "../lib/bot"

describe "Telegram Bot" do
    let(:chat_id) { "665821024" }
    let(:bot) { TelegramBot.new([ chat_id ], true)}

    describe "initialize" do
        it "Successfully starts a Telegram bot with empty chats if no parameter is given" do
            bot1 = TelegramBot.new([], true)
            expect(bot1.chats.empty?).to_not eql false
        end
        it "Successfully starts a Telegram bot with the given parameter" do
            expect(bot.chats).to eql [ chat_id ]
        end
        it "Successfully starts a Telegram bot with non empty chats if a parameter is given" do
            expect(bot.chats.empty?).to_not eql true
        end
        it "Successfully assigns an Array to the chats atribute" do
            expect(bot.chats.is_a? Array).to eql true
        end
    end
    describe "broadcast" do
        it "Succesfully broadcast a quote to each user in chats" do
            bot.broadcast do |id|
                expect(id).to eql chat_id
            end
        end
        it "Raise an error if chats is empty" do
            bot1 = TelegramBot.new([], true)
            expect { bot1.broadcast }.to raise_error(ArgumentError)
        end
    end
    describe "subscribed?" do
        it "Returns an Integer if chat id exists" do
            expect(bot.subscribed?(chat_id).is_a? Integer).to eql true
        end
        it "Does not returns an Integer if chat id does not exists" do
            expect(bot.subscribed?('0312584').is_a? Integer).to_not eql true
        end
        it "Returns false if chat id does not exists" do
            expect(bot.subscribed?(chat_id).is_a? Integer).to eql true
        end
    end

    describe "end_subscription" do
        it "Deletes chat from chats if chat exists" do
            bot.end_subscription chat_id
            expect(bot.chats.empty?).to_not eql false
        end
        it "Raise argument error if chat does not exists" do
            expect { bot.end_subscription }.to raise_error(ArgumentError)
        end
    end

end