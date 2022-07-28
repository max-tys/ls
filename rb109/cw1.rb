# In this kata, you've to count lowercase letters in a given string
# and return the letter count in a hash
# with 'letter' as key and count as 'value'.
# The key must be 'symbol' instead of string in Ruby.

# Input: a string
# Output: a hash that keeps count of the occurrences of characters in a string.
# Data structure: hashes, array of characters / letters / 1-char strings.
# Algorithm:
# Initialize a hash to count the frequency of characters.
# Convert the string into an array of characters.
# Iterate over the array of characters.
# => On each iteration, count the frequency of the character in the string
# => Store the value of the count in the key.
# Return the output hash.

def letterCount(string)
  frequency = {}
  string.chars.each do |char|
    char_freq = string.count(char)
    frequency[char.to_sym] = char_freq
  end
  frequency
end

p letterCount('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
