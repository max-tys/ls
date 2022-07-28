# Most frequently used words in a text
# Write a function that,
# given a string of text (possibly with punctuation and line-breaks),
# returns an array of the top-3 most occurring words,
# in descending order of the number of occurrences.

def top_3_words(text)
  words = text.downcase.split(/[^'\w]/).reject(&:empty?)
  return [] if ! words.all? { |word| word.match(/[a-z]/) }

  words.sort_by do |word|
    word = word.gsub(/'/, '')
    words.count(word)
  end.uniq.reverse[0,3]
end

str = "  '''  "
p top_3_words(str)