# Make a madlibs program that reads in some text from a text file that you have created,
# and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text
# and prints it.

# You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program,
# but the text data should come from a file or other external source.

# Your program should read this text,
# and for each line, it should place random words of the appropriate types into the text,
# and print the result.

require 'csv'

# Convert CSV file into CSV table.
word_list = CSV.parse(File.read('122_input_data.csv'), headers: true)

# # Convert CSV table into hash. Keys are strings, values are arrays.
# word_list = {}
# csv_word_list.by_col.each do |list|
#   word_list[list.first] = list.last
# end

# Open madlib template.
text = File.read('122_template.txt')

# Substitute each occurrence of %{} with the appropriate word from the hash.
text.gsub!(/%{.+?}/) do |match|
  word_list[match].sample
end

puts text
