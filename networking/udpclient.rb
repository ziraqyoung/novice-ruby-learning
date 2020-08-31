require 'socket'
# send data to a UDP server server running on port 1234
s = UDPSocket.new
s.send 'hello', 0, 'localhost', 1234
