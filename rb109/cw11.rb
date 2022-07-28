# Write a function that will return the count
# of distinct case-insensitive alphabetic characters
# and numeric digits that occur more than once in the input string.

# The input string can be assumed to contain
# only alphabets (both uppercase and lowercase) and numeric digits.

# Input - string consisting of alphabets and digits
# Output - integer - count of distinct, duplicate alphabets and digits
# Data structure - string, array
# Algorithm
# Initialize an array to store duplicate characters (dup_chars)
# Downcase every alphabet in the input string
# Iterate over each character in the string
# => Count the no. of occurrences of each character in iteration
# => If the occurrence is more than 1, store the said character in the dup_chars array
# Sieve out duplicates in dup_chars and count the number of items left in dup_chars

# def duplicate_count(text)
  # dup_chars = []
  # text = text.downcase
  # text.chars.each do |char|
  #   next if dup_chars.include?(char)
  #   dup_chars << char if text.count(char) > 1
  # end
  # dup_chars.size
# end

def duplicate_count(text)
  text = text.downcase.chars
  text.uniq.count { |char| text.count(char) > 1 }
end

p duplicate_count('abcd1Eaa') #== 1
