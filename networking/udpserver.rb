require 'socket'

# using socket lib to create a UDP serve binded to a port 1234
s = UDPSocket.new
# binding to port
s.bind(nil, 1234)
# preventing the server from ending gracefully
5.times do
  text, sender = s.recvfrom(16)
  puts text
end

