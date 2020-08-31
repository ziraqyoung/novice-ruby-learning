require 'rexml/document'

xml = <<END_XML
<people>
  <person>
    <name>Peter Cooper</name>
    <gender>Male</gender>
  </person>
  <person>
    <name>Fred Bloggs</name>
    <gender>Male</gender>
  </person>
</people>
END_XML

tree = REXML::Document.new(xml)
# loop through each person element in people element
tree.elements.each('people/person') do |person|
  # getting element from the given node
  puts person.get_elements("name").first
end
