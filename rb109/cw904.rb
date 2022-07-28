# Longest Palindrome
# Find the length of the longest substring in the given string s that is the same in reverse.
# As an example, if the input was “I like racecars that go fast”, the substring (racecar) length would be 7.
# If the length of the input string is 0, the return value must be 0.

# Input is a string
# Output is an integer that represents the length of the longest substring that's a palindrome

# Data structure / algorithm
# abcde --> a, ab, abc, abcd, abcde, b, bc, bcd, bcde ... e
# => Array of characters
# Generate an array of substrings
# => Require two counters to keep track of the first char and last char of the substring
# => Nested iteration (2 levels deep)
# Check if substring is a palindrome as we are generating them
# Store all palindromic substrings in a separate array
# Iterate over the array of palindromes, and check the length of the palindromes
# Return the length of the longest palindrome.

# def get_substrings(s)
#   substrings = []
#   0.upto(s.length - 1) do |first_idx|
#     first_idx.upto(s.length - 1) do |last_idx|
#       substrings << s[first_idx..last_idx]
#     end
#   end
#   substrings
# end

# def palindrome?(s)
#   s == s.reverse
# end

# def longest_palindrome(s)
#   return 0 if s.empty?
#   substrings = get_substrings(s)
#   substrings.select { |substring| palindrome?(substring) }
#             .max_by { |palindrome| palindrome.length }
#             .length
# end

# 'Clever' implementation
def longest_palindrome(s)
  return 0 if s.empty?
  palindromes = []
  1.upto(s.length) do |substring_size|
    s.chars.each_cons(substring_size) do |substring|
      palindromes << substring.join if substring.join == substring.join.reverse
    end
  end
  palindromes.max_by { |palindrome| palindrome.length }.size
end

p longest_palindrome('')
