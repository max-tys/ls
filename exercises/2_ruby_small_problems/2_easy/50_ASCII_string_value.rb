def ascii_value(string)
  # Or string.each_char - this iterates over each character.
  string.chars.reduce(0) { |sum, char| sum + char.ord }
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# The mystery method which converts ascii no to char is Integer#chr.
# If you call the String#ord method on a multi-character string, ...
# ... you get the integer ordinal of the first character of self.
