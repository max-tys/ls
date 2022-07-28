# Write a method that takes a string argument,
# and returns true
#   if all of the alphabetic characters inside the string are uppercase,
# false otherwise.
# Characters that are not alphabetic should be ignored.

def uppercase?(string)
  ! string.match(/[a-z]/)
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Further exploration
# Is uppercase? looking for the presence of uppercase characters?
# Or is it looking for the absence of lowercase characters?
# If the answer is the former, then it should return false for empty string arguments.
# If the answer is the latter, then it should return true for empty string arguments.
