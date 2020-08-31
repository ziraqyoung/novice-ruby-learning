require 'gserver' # gem install gserver

# subclass GServer to create a 'generic server'
class HelloServer < GServer
  def serve(io)
    io.puts 'Say something to me!'
    line = io.gets
    io.puts "You said '#{line.chomp}'"
  end
end

# create a generic server
# server = HelloServer.new 1234
# server.start
# server.join

# multipe servers with port,
# host(interface) and maximum number of connections allowed
# server1 = HelloServer.new 1234, 'localhost', 4
# server1.start
# server2 = HelloServer.new 1235, 'localhost', 4
# server2.start
# sleep 10

# create a server if no GServer instance is running on that
# particular port
if GServer.instance_in?(1234)
  puts "Can't create a new server already running"
else
  server = HelloServer.new 1234
end

server.start

# exit the main program if a server is stopped
loop do
  # causes the main program to end by conecting to the server
  # and typing shutdown which causes a call to
  # server.stop
  break if server.stopped?
end

puts 'Server has been terminated!'
