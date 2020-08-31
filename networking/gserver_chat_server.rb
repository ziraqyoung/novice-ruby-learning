require 'gserver' # gem install gserver

# a GServer for a chat system
class ChatServer < GServer
  def initialize(*args)
    super(*args)
    # Keep an overall record of all clients IDs allocated
    # and the lines of chat
    @client_id = 0
    @chat = []
  end

  def serve(io)
    # Increment the client ID so that each client gets a unique ID
    @client_id += 1
    my_client_id = @client_id
    my_position = @chat.size

    # Welcome the new client
    io.puts "Welcome to the chat, #{client_id}"

    # Leave the message to the chat queue to signify
    # this client has joined the chat
    @chat << [my_client_id, '<Join the chat>']

    loop do
      # Every 2 sec check to see if we are receiving any data
      if IO.select([io], nil, nil, 2)
        # if so retrieve the data and process it
        line = io.gets

        # If the user says quit disconnect them
        if line =~ /quit/
          @chat << [my_client_id, '<leaves the chat>']
          break
        end

        # Shutdown the server if we hear shutdown
        self.stop if line =~ /shutdown/

        # Add the client's text to the chat array along with the
        # client's ID
        @chat << [my_client_id, line]
      else
        # No data, so print new lines to the chat stream
        @chat[my_position..(@chat.size - 1)].each_with_index do |line, index|
          io.puts "#{line[0]} says: #{line[1]}"

          # move the position to one past the end of the array
          my_position = @chat.size
        end
      end
    end
  end
end

# create a gserver on port 1234
server = ChatServer.new 1234
server.start

# exit the main program if the server is stopped
loop do
  break if server.stopped?
end
