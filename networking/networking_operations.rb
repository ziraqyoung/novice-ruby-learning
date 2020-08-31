# require 'net/ping'
require 'resolv'
require 'net/smtp'
require 'net/telnet'

# checking if a machine is availabe on the network using 'net/ping'
# if Net::Ping::External.new('www.google.com').ping
# puts 'Pong!'
# else
# puts 'No response!'
# end

# connecting to a service(particular port) using TCP or UDP
# if Net::Ping::TCP.new('www.google.com', 80).ping
# puts 'Pong!'
# else
# puts 'No response!'
# end

# perform a DNS lookup
puts Resolv.getaddress 'www.google.com'
puts Resolv.getaddress 'www.rubyonrails.org'

# perform the reverse of DNS lookup
ip = '192.0.34.166' # 34-166.lax.icann.org
begin
  puts Resolv.getname ip
rescue
  puts "No hostname associated with #{ip} IP address"
end

# using Resolve to search for MX records
Resolv::DNS.open do |dns|
  mail_servers = dns.getresources('www.google.com',
                                  Resolv::DNS::Resource::IN::MX)
  mail_servers.each do |server|
    puts "#{server.exchange.to_s} - #{server.preference}"
  end
end

# using MX records to send e-mail via connecting to directly to mail server
from = 'your-email@example.com'
to = 'another-email@example.com'
message = <<MESSAGE_END
  From: #{from}
  To: #{to}
  Subject: Direct e-mail test

  This is a test email message
MESSAGE_END
# getting the domain
to_domain = to.match(/\@(.+)/)[1]
# using dns to connect and net/smtp to send the message
Resolv::DNS.open do |dns|
  mail_servers = dns.getresources(to_domain, Resolv::DNS::Resource::IN::MX)
  mail_server = mail_servers[rand(mail_servers.size)].exchange.to_s

  # sending an e-mail to the mail server directly
  Net::SMTP.start(mail_server) do |smtp|
    smtp.send_message message, from, to
  end
end

server = Net::Telnet::New('Host' => 'www.rubyinside.com',
                          'Port' => 80,
                          'Telnetmode' => false)
server.cmd("GET /test.txt HTTP/1.1\nHost: www.rubyinside.com\n") do |response|
  puts response
end

