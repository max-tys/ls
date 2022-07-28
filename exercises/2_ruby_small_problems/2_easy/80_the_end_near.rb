# Write a method that returns the next to last word in the String passed to it as an argument.
# Words are any sequence of non-blank characters.
# You may assume that the input String will always contain at least two words.

# Original solution
# def penultimate(string)
#   string.split[-2]
# end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

# Further exploration - extract the middle word
# This implementation takes the second word for phrases and sentences
# that contain an even number of words.

def middle(string)
  return string if string.empty?

  middle_index = string.split.size / 2

  string.split[middle_index]
end

p middle('') == ''
p middle('one') == 'one'
p middle('one two') == 'two'
p middle('one two three') == 'two'
p middle('one two three four') == 'three'
