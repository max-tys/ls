# Longest vowel chain
# The vowel substrings in the word codewarriors are o,e,a,io.
# The longest of these has a length of 2.
# Given a lowercase string that has alphabetic characters only (both vowels and consonants) and no spaces,
# return the length of the longest vowel substring.
# Vowels are any of aeiou.

# Input is a lowercase string [a-z] only.
# Output is an integer - length of the longest vowel substring.

# Data structure - array of characters
# Algorithm
# Initialize longest_vowel_length = 0
# Initialize current_vowel_length = 0
# Initialize an array of vowels
# Iterate over characters in the input string
# If the character is a consonant, reassign curr_v_len to 0
# If the character is a vowel
# => increment curr_v_len by 1
# => if curr_v_len has exceeded long_v_len, reassign long_v_len to curr_v_len
# Return longest_vowel_length

# s.scan(/[aeiou]+/).map(&:size).max

def solve(s)
  vowels = %w(a e i o u)
  longest_vowel_length = 0
  current_vowel_length = 0

  s = s.chars
  s.each do |char|
    if vowels.include?(char)
      current_vowel_length += 1
      longest_vowel_length = current_vowel_length if current_vowel_length > longest_vowel_length
    else
      current_vowel_length = 0
    end
  end

  longest_vowel_length
end

s = 'codewarriors'

