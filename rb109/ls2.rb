# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Attempt 2
# Input is an array of integers
  # positive, negative, and zeroes
# Output is either nil or an integer
  # Return nil if the input array contains less than 5 elements
  # The output integer may be a negative number
  # Output represents the smallest sum of 5 consecutive nums in the array
# Algorithm
  # Return nil if input has less than 5 numbers
  # Iterate over the input array of numbers
  # On each iteration, carve out a subarray of 5 consecutive nums
    # Calculate the sum of the numbers in the sub-array
    # Store the sum in a new array (sums)
  # End the iteration when we can no longer create a subarray of 5 consec nums
  # Find the smallest number in the sums array, and return that number

def minimum_sum(input)
  return nil if input.size < 5

  sum_nums = []

  input.each_index do |idx|
    break if input[idx, 5].size < 5
    sum_nums << input[idx, 5].sum
  end

  sum_nums.min
end

# Examples:

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".



# Attempt 1
# Input: an ordered array of integers

# Output: the minimum sum of 5 consecutive numbers in the array
# Consecutive is with reference to the order of the numbers as they are presented in the array.

# Proposed approach:
# Return nil if the size of the array is less than 5.
# Iterate over each element of the array until we cannot do so anymore.
# --> We stop once we find that the slice contains less than 5 numbers.
# Initialize a variable called min_sum.
# This variable will be updated everytime we find a smaller sum.

# CONSEC_NUM_COUNT = 5

# def minimum_sum(array)
#   min_sum = nil

#   array.each_with_index do |num, idx|
#     break if array[idx, CONSEC_NUM_COUNT].size < CONSEC_NUM_COUNT
#     sum = array[idx, CONSEC_NUM_COUNT].sum
#     min_sum = sum if idx == 0 || sum < min_sum
#   end

#   min_sum
# end
