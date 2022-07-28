# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Attempt 2

# Input - string
  # Words are delimited by spaces
  # Words only contain alphabetical characters
# Output - transformed string
  # We only transform every third word in the input string
  # E.g. first and second words are left intact
  # The third word will have every 2nd character converted to upcase
  # Length of the input and output strings are the same
# Algorithm
  # Iterate over each word in the string
    # Convert/split the string of words into an array of words
  # Transform every third word in the array of words
    # Indexes 2, 5, 8, 11, 14 ...
    # Define a helper method for the transformation (weird_word)
      # Input - a string (word)
      # Output - a transformed string (word)
      # Algorithm
        # Split the word into an array of letters
        # Skip over the letters at index 0, 2, 4, 6, 8 ... (even)
        # Upcase the letters at index 1, 3, 5, 7, 9 ... (odd)
        # Convert the array of transformed letters into a string
        # Return the transformed string
  # Join the array of transformed words into a string of xformed words
  # Return the string of transformed words

def weird_word(string)
  letters = string.chars
  letters.map.with_index do |letter, idx|
    idx.odd? ? letter.upcase : letter
  end.join
end

def to_weird_case(string)
  words = string.split
  words.map.with_index do |word, idx|
    idx % 3 == 2 ? weird_word(word) : word
  end.join(' ')
end

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".


# Attempt 1


# Input: a string
# Output: a string (every 3rd word converted)
# Approach
# Iterate over the words of the string (convert the string to an array of words)
# Transform every third word in the array.
# Define a helper method to transform the third word.
# Helper method will split the word into its characters and transform every second char.
# Return the transformed string.

# def make_weird_word(string)
#   string.chars.map.with_index do |char, idx|
#     idx.odd? ? char.upcase : char
#   end.join
# end

# def to_weird_case(string)
#   string.split.map.with_index do |word, idx|
#     idx % 3 == 2 ? make_weird_word(word) : word
#   end.join(' ')
# end
