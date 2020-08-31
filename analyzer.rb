# use File.open or File.readlines
stop_words = %w{the a by on for of are with just but and to the my I has some in}

lines = File.readlines(ARGV[0])

line_count = lines.size
text = lines.join

# Counting words, characters, paragraphs and sentences
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/, "").length
word_count = text.split.length
paragraph_count = text.split(/\n\n/).length
sentence_count = text.split(/\.|\?|!/).length

# Making a list of the words that aren't stop words
# Couting them and work out the percentages of non-stop words
# against all words
all_words = text.scan(/\w+/)
good_words = all_words.reject { |word| stop_words.include?(word) }
good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i


# Summarize the text by cherry picking some choice
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospaces} characters excluding spaces"
puts "#{word_count} words"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count} sentences"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "#{good_percentage}% of the words are non-fluff words"
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"
