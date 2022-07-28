# The valid_series? method checks whether a series of numbers is valid.
# For the purposes of this exercise, a valid series of numbers must contain exactly three odd numbers.
# Additionally, the numbers in the series must sum to 47.
# Unfortunately, our last test case is not returning the expected result. Why is that?

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3 ? true : false
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false

# The bug lies in `line 11` of the code.
# The expression `odd_count = 3` evaluates to `3`, which in turn evaluates to true.
# Since `3` is a truthy value, the `valid_series?` method will return true.
# We can fix this by changing `odd_count = 3` to `odd_count == 3`.
# We replace the assignment operator with the Boolean comparison operator.
