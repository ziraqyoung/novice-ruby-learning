require 'open-url'
require 'net/ftp'
require 'uri'
require 'tempfile'

# using open-uri library
#
output = File.new('1.8.2-patch1.gz', 'wb')
# Connect to an FTP server with open() by open-url
open('ftp://ftp.ruby-lang.org/pub/ruby/1.8/1.8.2-patch1.gz') do |f|
  # read the file on ftp server and save it locally to a file
  output.print f.read
end

# Using net/ftp for lowlevel access to FTP server
uri = URI.parse 'ftp://ftp.ruby-lang.org/'

Net::FTP.open(uri.host) do |ftp|
  ftp.login 'anonymous', 'me@privacy.net'
  ftp.passive = true
  ftp.list(uri.path) { |path| puts path }
end

# Downloading a remote binary file using 'net/ftp'
#
ftp = Net::FTP.new('ftp.ruby-lang.org')
ftp.passive = true
ftp.login
ftp.chdir('/pub/ruby/1.8')
ftp.getbinaryfile('1.8.2-patch1.gz')
ftp.close

# to avoid program locking as getbinaryfile downloads a file
# use ftp.getbinaryfile with a block

ftp.getbinaryfile('ruby-1.8.7.tar.gz', 'local-filename', 102_400) do # |blk|
  puts 'A 100KB of the file hase been downloaded'
end

# Uplaoding a file to an FTP server using 'net/ftp'
#
ftp = Net::FTP.new('ftp.domain.com') # require ftp.close
ftp.passive = true
ftp.login
ftp.chdir('/path/to/your/filename')
ftp.putbinaryfile('localfile') # upload a file to an ftp server

# put binary file with a block
count = 0
ftp.putbinaryfile('local-file', 'remote-file', 100_000) do # |block|
  count += 100_000
  puts "#{count} bytes uploaded"
end
ftp.close

# data put in a tepfile then uploaded deleted latter on
tempfile = Tempfile.new 'test'
my_data = 'This is some test data I want to upload via FTP'
tempfile.puts my_data
ftp = Net::FTP.new 'ftp.domain.com'
ftp.passive = true
ftp.login
ftp.chdir 'your/folder/name/here'
ftp.puttextfile tempfile.path, 'my_data' # location of the file to upload
ftp.close
tempfile.close
