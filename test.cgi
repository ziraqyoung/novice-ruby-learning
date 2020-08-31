#!/usr/bin/env ruby

require 'cgi'

cgi = CGI.new

p cgi.header
p "<html><body>This is a test</body></html>"
