# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining digits,you get 329175.
# Keep the first 2 digits fixed in place and rotate again to 321759.
# Keep the first 3 digits fixed in place and rotate again to get 321597.
# Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579.
# The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation of that argument.
# You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

def rotate_array(array)
  array[1..-1].push(array[0])
end

def rotate_rightmost_digits(number, n)
  string_number = number.to_s.chars

  string_number[-n..-1] = rotate_array(string_number[-n..-1])

  string_number.join.to_i
end

# Original solution
# def max_rotation(number)
#   (number.to_s.size).downto(1) do |i| # No need to go down to 1. downto(2) will suffice.
#     number = rotate_rightmost_digits(number, i)
#   end
#   number
# end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

def max_rotation(number)
  string_number = number.to_s.chars
  string_number.size.downto(1) do |i|
    string_number[-i..-1] = rotate_array(string_number[-i..-1])
  end
  string_number.join
end

p max_rotation(735291) == '321579'
p max_rotation(3) == '3'
p max_rotation(35) == '53'
p max_rotation(105) == '015'
p max_rotation(10025) == '02150'
p max_rotation(8_703_529_146) == '7321609845'
