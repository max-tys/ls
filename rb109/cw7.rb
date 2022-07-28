# Detect Pangram

# A pangram is a sentence that contains every single letter of the alphabet at least once.
# For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram,
# because it uses the letters A-Z at least once (case is irrelevant).

# Given a string, detect whether or not it is a pangram.
# Return True if it is, False if not.
# Ignore numbers and punctuation.

# Input is a string
# Output is a Boolean value - true if it is a pangram, false otherwise

# Data structure(s) - array, string
# Algorithm
# Convert the input string to downcased characters
# Initialize an array of alphabets
# Iterate through the array of alphabets
# => Check if each alphabet appears in the input string
# => Return false if the alphabet in iteration is not used in the input string.
# => Return true at the end of the iteration

def pangram?(string)
  string = string.downcase
  ('a'..'z').to_a.all? { |alphabet| string.include?(alphabet) }
end
