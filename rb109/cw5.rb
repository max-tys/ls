# Non-even substrings
# Given a string of integers, return the number of odd-numbered substrings that can be formed.
# For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

# Input is a string of integers
# Output is an integer - the number of odd-numbered substrings that can be formed
# without switching the order of the integers in the original string

# Data structure - array of numbers / string slices
# Algorithm
# Create substrings of increasing lengths e.g. 1 .. 4
# Evaluates whether substring is an odd-number
# Increment odd_count by one if the substring is an odd number
# Return the odd_count after iterating through the input string.

def solve(s)
  odd_count = 0
  s = s.chars
  (1..(s.length)).each do |substring_length|
    s.each_index do |idx|
      break if s[idx, substring_length].length < substring_length
      odd_count += 1 if s[idx, substring_length].join.to_i.odd?
    end
  end
  odd_count
end

p solve("1341") == 7
