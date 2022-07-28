# We wrote a neutralize method that removes negative words from sentences.
# However, it fails to remove all of them. What exactly happens?

def neutralize(sentence)
  words = sentence.split(' ')
  # words.each do |word|
  #   words.delete(word) if negative?(word)
  # end

  words.reject! do |word|
    negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# We are mutating the `words` array as we iterate over the array by calling the `each` method on it.
# This causes `each` to skip over the word after a negative word.
# We should call Array#reject instead of Array#each.
