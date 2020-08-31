require 'net/http'
require 'net/https'

url = URI.parse 'https://example.com'

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true if url.scheme == 'https'

# Get request with HTTPS
# request = Net::HTTP::Get.new url.path
# puts http.request(request).body

# POST request with HTTPS
req = Net::HTTP::Post.new url.path
req.set_form_data('credit_card_numer' => '1234123412341234')
puts http.request(req).body

