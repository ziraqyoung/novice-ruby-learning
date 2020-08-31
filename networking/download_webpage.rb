require "net/http"

# Net::HTTP.start('www.rubyinside.com') do |http|
# req = Net::HTTP::Get.new '/test.txt'
#
# puts http.request(req).body
# end

# url = URI.parse 'http://www.rubyinside.com/test.txt' # requires http://

# 'net/http' provides basic auth including downloading web pages
# url = URI.parse 'http://browserspy.dk/password-ok.php'
# Net::HTTP.start(url.host, url.port) do |http|
# req = Net::HTTP::Get.new url.path
#
## basic authentication
# req.basic_auth('test', 'test')
#
# puts http.request(req).body
# end

# simpler way to perform a GET request
# response = Net::HTTP.get_response url
# puts response.body

# Error checks

# def get_web_content(url)
# uri = URI.parse url
#
# response = Net::HTTP.get_response(uri)
#
# case response
# when Net::HTTPSuccess
# return response.body
# when Net::HTTPRedirection
# return get_web_content(response['Location'])
# else
# nil
# end
# end
# puts get_web_content 'http://rubyinside.com/test.txt'
# puts get_web_content 'http://rubyinside.com/non_existence'
# puts get_web_content 'http://rubyinside.com/redirect-test'

# other responses classes eg HTTPNotFound, HTTPForbidden etc

# Posting form data to url
# url = URI.parse 'http://www.rubyinside.com/test.cgi'
# response = Net::HTTP.post_form(url, { 'name' => 'David', 'age': '24' })
# puts response.body

# Getting controlling of the post process to implement basic authentication
# url = URI.parse 'http://www.rubyinside.com/test.cgi'
# Net::HTTP.start(url.host, url.port) do |http|
# req = Net::HTTP::Post.new url.path
# req.set_form_data('name' => 'David', 'age' => '26')
# puts http.request(req).body
# end

# Proxying using 'net/http'
#
# net/http support for HTTP requests proxying
# proxying is when request do not go directly between the
# client and web seever but via a third party route
# web_proxy = Net::HTTP::Proxy('your.hostname.or.ip', 8080)
# url = 'http://www.rubyinside.com/test.txt'
#
web_proxy.start(url.host, url.port) do |http|
	req = Net::HTTP::Get.new url.path
	puts http.request(req).body
end
# or
res = web_proxy.get_response(url)
puts res.body

## ARGV[0] rep the hostname or IP || ARGV[1] rep proxy port
# http_class = ARGV.first ? Net::HTTP::Proxy(ARGV[0], ARGV[1]) : Net::HTTP
# url = URI.parse 'http://www.rubyinside.com/test.txt'
#
# response = http_class.get_response(url)
# puts response.body


