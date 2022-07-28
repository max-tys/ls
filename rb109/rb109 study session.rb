# First problem

# def expanded_form(int)
#   # Split the integer into its digits. 70304 --> [4, 0, 3, 0, 7]
#   digits = int.digits

#   # Transform each digit into the number that it actually represents
#   expanded_nums = digits.map.with_index do |digit, idx|
#     digit_position = idx
#     digit * (10**digit_position) # 3 * 10**2 = 3 * 100 = 300
#   end

#   # Remove the zeroes from the array of numbers
#   expanded_nums.select! { |num| num != 0 }

#   # Array#reverse! is required because we want to print the biggest num first
#   expanded_nums.reverse!

#   # Convert the array of numbers to a string.
#   expanded_nums.join(' + ')
# end

# p expanded_form(70304) == "70000 + 300 + 4"
# p expanded_form(12345) == "10000 + 2000 + 300 + 40 + 5"
# p expanded_form(100_000_001) == "100000000 + 1"

# Second problem

# Attempt 2
# Input - a string of characters
  # Can be any sort of character
# Output - a string of transformed characters
  # Special characters remain the same
  # Alphabetical characters are transformed
    # Replace each letter by a letter 3 positions down the alphabet
    # For x, y, and z, replace them with a, b, and c respectively
  # Retain the original case of the letter (case-sensitive)
# Algorithm
  # Split the string into an array of characters
  # Iterate over the array of characters
  # If we have a non-alphabetical character, do nothing to it
  # If we have an uppercase letter, transform it into another uppercase letter
  # If we have a lowercase letter, transform it into another lowercase letter
  # Two helper methods to transform alphabetical characters
    # Input - a string (char)
    # Output - a transformed char
    # Algorithm
      # Initialize an array of upcase alphabets ['A'..'Z']
      # Initialize an array of downcase alphabets ['a'..'z']
      # Check whether the character is in the upcase array or the downcase array
      # Find out the index of the input character e.g. 'B' --> 1
      # Return the character that is at index (1+3) e.g. alphabets[4] --> 'E' (ABCDE)
      # If the index exceeds 25 e.g. 'z' --> 25, output char --> 28
        # Return the character at index 28 - 26 = 2, alphabets[2] --> 'c'
  # Convert the array of transformed letters to a string of transformed letters

def shift(char)
  alphabets = ('A'..'Z').to_a
  idx = alphabets.index(char.upcase)
  output = alphabets[(idx + 3) % 26]
  char == char.upcase ? output : output.downcase
end

def transform(string)
  string.chars.map do |letter|
    letter.match(/[A-Za-z]/) ? shift(letter) : letter
  end.join
end

p transform("ABCXYZ abcxyz !@#$%^&*") == "DEFABC defabc !@\#$%^&*"
p transform("this long cake@&") == "wklv orqj fdnh@&"
p transform("Road trip9") == "Urdg wuls9"
p transform("EMAILZ@gmail.com") == "HPDLOC@jpdlo.frp"
p transform('xyz') == ('abc')

# Attempt 1
# def transform(str)
#   str.chars.map do |char|
#     # Check if this is a lowercase character
#     if char.match(/[a-z]/)
#       # We need to check if the char's ascii number is greater than 'z'
#       char.ord + 3 > 122 ? ((char.ord + 3) - 26).chr : (char.ord + 3).chr
#     # Otherwise, if this is an uppercase character
#     elsif char.match(/[A-Z]/)
#       # Check if the char's ascii number is greater than 'Z'
#       char.ord + 3 > 90 ? ((char.ord + 3) - 26).chr : (char.ord + 3).chr
#     else
#       char
#     end
#   end.join
# end
