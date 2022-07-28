# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique svalues. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Attempt 2

# Input is an array of numbers
# Output is also an array of numbers
  # Each number represents the number of integers smaller than the input number
  # Count only the unique values that are smaller than the input number
  # The input number and output number are in the same index of both arrays
  # The size of the output array is the same as the size of the input array
# Algorithm
  # Iterate over each number in the input array
  # On each iteration, count the number of unique values that are smaller than it
  # This count will be placed in the output array
  # Once we finish iterating over the input array, return the output array

def smaller_numbers_than_current(input)
  input.map do |num1|
    count = 0
    input.uniq.each do |num2|
      count += 1 if num1 > num2
    end
    count
  end
end

# Examples:
p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".



# Attempt 1

# Input - an array of integers.
# Output - an array of integers, containing the same number of integers as the input array
# each integer relates to the integer in the same index in the input array
# it represents the number of integers that are smaller than the original num.

# Proposed solution: Iterate over each element of the array. map is more suited for transformation.
# For each element of the array, iterate over every other UNIQUE element of the array.
# There will be a loop within a loop.
# The number in iteration in the outer loop will be compared with every other unique number in the array.
# We compare them with the '>' operator.
# If the outer number is greater than the inner number, we will increment the count by one.
# We will return an array that consists of the 'smaller number count' for each number in the original array.

# def smaller_numbers_than_current(array)
#   array.map do |num1|
#     smaller_num_count = 0
#     array.uniq.each do |num2|
#       smaller_num_count += 1 if num1 > num2
#     end
#     smaller_num_count
#   end
# end
