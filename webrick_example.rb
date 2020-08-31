require 'webrick'

# Basic HTTp server with WEBrick::GenericServer

# server = WEBrick::GenericServer.new Port: 1234
#
# trap("INT") { server.shutdown }
#
# server.start do |socket|
  # socket.puts Time.now
# end

# Creating servlets
#
class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(req, res)
    res.status = 200
    res.content_type = 'text/plain'
    res.body = "You are trying to load #{req.path}"
  end
end

server = WEBrick::HTTPServer.new Port: 1234

server.mount '/', MyServlet

trap('INT') { server.shutdown }
server.start
