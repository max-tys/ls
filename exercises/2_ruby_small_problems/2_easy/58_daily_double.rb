# Original solution

# Create two markers - present and next (i.e. present + 1).
# Iterate through each character in the string.
# End the iteration when the next marker hits nil.
# Compare the present character with the next character.
# If they are equal, delete the next character.
# Compare the next pair until the loop ends.

=begin
def crunch(string)
  # Handle the edge case of an empty string
  return string if string == ''

  # Iterate through each character
  index = 0
  loop do
    if string[index] == string[index + 1]
      string[index + 1] = ''
    else
      index += 1
      break if string[index] == nil
    end
  end

  # Return string at the end of the method
  string
end

# Further exploration with String#chars

def crunch(string)
  index = 0
  squeezed_string = ''
  char_array = string.chars
  while index < string.length
    if char_array[index] != char_array[index + 1]
      squeezed_string << char_array[index]
    end
    index += 1
  end
  squeezed_string
end

=end

# Further exploration with Regex

def crunch(string)
  string.gsub(/(.)\1{1,}/, '\1')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
