require_relative "../bin/main"

every 1.day, at: '8:00 am' do
    runner "Sending quote to all of our friends"
    bot.broadcast
end
