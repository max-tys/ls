# Complete the function scramble(str1, str2) that returns true
# if a portion of str1 characters can be rearranged to match str2,
# otherwise returns false.
# Only lower case letters will be used (a-z).
# No punctuation or digits will be included.
# Performance needs to be considered.

# Inputs are two strings, str1, str2
# Output is a boolean value depending on whether str2 can be made from str1's chars

# Data structure: strings, arrays of characters
# Algorithm
# Iterate over the characters in str2
# => Count the number of occurrences of each character in str2
# => Check whether the first string contains >= number of chars in str2
# => If the first string does not have enough chars to form str2, return false
# Return true at the end of the method

def scramble(s1, s2)
  s2.chars.uniq.all? { |char| s2.count(char) <= s1.count(char) }
end

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('', 'world') == false
p scramble('world', '') == true
p scramble('', '') == true
