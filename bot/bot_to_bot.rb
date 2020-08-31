require_relative 'bot'

fred = Bot.new name: 'Fred', data_file: 'fred.bot'
chris = Bot.new name: 'Chris', data_file: 'fred.bot'

r = fred.greeting

10.times do
  sleep 1
  puts "#{fred.name} said: " + r
  r = chris.response_to(r)
  sleep 1
  puts "#{chris.name} said: " + r
  r = fred.response_to(r)
end
