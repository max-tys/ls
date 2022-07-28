# A double number is a number with an even number of digits
# whose left-side digits are exactly the same as its right-side digits.
# For example, 44, 3333, 103103, 7676 are all double numbers.
# 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument,
# unless the argument is a double number; double numbers should be returned as-is.

def twice(num)
  string_num = num.to_s

  center_index = string_num.size / 2

  left_side = string_num[0...center_index] # if index is 3, range 0-2, excl 3
  right_side = string_num[center_index..-1] # for odd nums, right side is longer than left side

  left_side == right_side ? num : num * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
