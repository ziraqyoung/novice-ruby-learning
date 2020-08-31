require 'socket'

server = TCPServer.new 1234 # creates a TCP server on port 1234

while (connection = server.accept) # accept a connection to a client
  while (line = connection.gets)
    break if line =~ /quit/

    puts line
    connection.puts 'Received!'
  end

  connection.puts 'Closing the connection. Bye!'
  connection.close
end
