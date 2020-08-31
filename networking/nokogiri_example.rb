# 1. loads the nokogiri library
require 'nokogiri'
require 'open-uri' # can work with open-uri open method

# 2. parse an html as a string
html = <<END_OF_HTML
<html>
<head>
<title>This is the page title</title>
</head>
<body>
<h1>Big heading!</h1>
<p>A paragraph of text.</p>
<ul><li>Item 1 in a list</li><li>Item 2</li><li class="highlighted">Item
3</li></ul>
</body>
</html>
END_OF_HTML

# 3. create a document based on the parsed html string
# doc = Nokogiri::HTML(html)
doc = Nokogiri::HTML(open('http://www.rubyinside.com/test.html'))

# 4. perform searches and processing of the html via the created doc
puts doc.css('h1').first.inner_html
# searching for list items by search methods by nokogiri
list = doc.css('ul').first
list.css('li') do |item|
  puts item.inner_html
end

