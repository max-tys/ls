# In this kata, you've to count lowercase letters in a given string
# and return the letter count in a hash with 'letter' as key and count as 'value'.
# The key must be 'symbol' instead of string in Ruby.

# Example:
# letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

# Input is a string
# Output is a hash
  # Counts the number of occurrences of each character in the input string
# Algorithm
  # Initialize the hash which will be returned (count)
  # Get the unique characters in the string (without mutating the original string)
  # Count the number of times each char appears in the original string
  # Store the count in a hash
  # Return hash

def letter_count(str)
  count = {}
  str.chars.uniq.each { |char| count[char.to_sym] = str.count(char) }
  count
end
