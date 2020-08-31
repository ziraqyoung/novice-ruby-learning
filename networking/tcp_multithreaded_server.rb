require 'socket'

server = TCPServer.new 1234

loop do
  Thread.start(server.accept) do |connection|
    while (line = connection.gets)
      break if line =~ /quit/

      puts line
      connection.puts 'Received!' # send data to that particular client
    end

    connection.puts 'Closing the connection. Bye!'
    connection.close # closes the connection
  end
end
