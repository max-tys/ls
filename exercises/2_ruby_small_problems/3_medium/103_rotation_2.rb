# Write a method that can rotate the last n digits of a number.

def rotate_array(array)
  array[1..-1].push(array[0])
end

def rotate_rightmost_digits(number, n)
  string_number = number.to_s

  left = string_number[0..(-1 - n)] # '735'
  right = string_number[-n..-1] # '291'

  (left + rotate_array(right.chars).join).to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
