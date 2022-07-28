# Write a method that takes a string as an argument,
# and returns true if all parentheses in the string are properly balanced, false otherwise.
# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

def balanced?(string)
  balanced = 0

  string.chars.each do |char|
    balanced += 1 if char == '('
    balanced -= 1 if char == ')'
    return false if balanced < 0
  end

  balanced == 0

  # For added functionality, return false if balanced != 0
  # Replicate the each call, but for [], {}.
  # Check if the number of "" and '' quotes are even.
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('()))((()') == false
