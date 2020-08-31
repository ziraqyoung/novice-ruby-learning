# frozen_string_literal: true

require 'open-uri'
# returns an StringIO object
# f = open('http://www.rubyinside.com/test.txt')
# puts f.readlines.join
# puts "the document is #{f.size} bytes in length"

# f.each_line do |line|
  # puts line
# end

# opening in block style
open('http://www.rubyinside.com/test.txt') do |f|
  puts f.readlines.join
  puts "The file size is #{f.size} bytes in length"
end

# Using open method on URI objects directly
url = URI.parse 'http://www.rubyinside.com/test.txt'
url.open { |f| puts f.read }

# Supports methods by IO objects eg read + constituents library
f = open('http://www.rubyinside.com/test.txt')
# methods by net/http library available to open method
puts f.content_type
puts f.charset
puts f.last_modified

# open method with additional headers to the request
f = open('http://www.rubyinside.com/test.txt',
         'User-Agent' => 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)')
puts f.read

