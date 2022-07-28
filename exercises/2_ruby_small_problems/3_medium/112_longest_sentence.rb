# f = File.open('112_constitution.txt')
f = File.open('112_frankenstein.txt')

passage = f.read

# Solution to original problem

# def longest_sentence(txt)
#   txt.gsub!(/\n/, ' ')

#   sentences = txt.scan(/(.+?[.?!])/)

#   sentences.map! do |sentence|
#     sentence[0].strip
#   end

#   sentences.sort_by! do |sentence|
#     sentence.split.size
#   end

#   sentences.last
# end

# puts "The longest sentence in the passage is: \"#{longest_sentence(passage)}\""
# puts "The number of words in that sentence is #{longest_sentence(passage).split.size}."

# Further exploration - longest word
def longest_word(txt)

  words = txt.split(/[^[a-z]]/i)

  words.map! do |word|
    word unless word.empty?
  end.compact!

  words.max_by { |word| word.size }
end

puts "The longest word in the passage is \"#{longest_word(passage)}\"."
puts "This word has #{longest_word(passage).size} characters."
