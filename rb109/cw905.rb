# How many numbers III?
# https://www.codewars.com/kata/5877e7d568909e5ff90017e6/train/python

# We want to generate all the numbers of three digits where:
# the sum of their digits is equal to 10.
# their digits are in increasing order (the numbers may have two or more equal contiguous digits)
# The numbers that fulfill the two above constraints are: 118, 127, 136, 145, 226, 235, 244, 334

# Make a function that receives two arguments:
# the sum of digits value
# the desired number of digits for the numbers

# The function should output an array with three values: [1,2,3]
# 1 - the total number of possible numbers
# 2 - the minimum number
# 3 - the maximum number

# # The example given above should be:
# p find_all(10, 3) == [8, 118, 334]

# # If we have only one possible number as a solution, it should output a result like the one below:
# p find_all(27, 3) == [1, 999, 999]

# # If there are no possible numbers, the function should output the empty array.
# p find_all(84, 4) == []

# # The number of solutions climbs up when the number of digits increases.
# p find_all(35, 6) == [123, 116999, 566666]

# Input - two integers in an array
  # The desired sum (sum)
  # The number of digits in every number whose sum equals the desired sum (n)
# Output - three integers in an array
  # The number of possible solutions
  # The min solution
  # The max solution
# Algorithm
  # Brute force
    # Generate all possible numbers of n-length e.g. 100 to 999 if n = 3
    # Sum the digits in the number in iteration
    # Compare the sum to the desired_sum (constraint #1)
    # Check if the digits are in increasing order (constraint #2)
  # Alternative solution
    # Create a helper method that generates all numbers of n-length that meet constraint #2
      # First digit will always start from 1
      # Second digit will be equal to or greater than first digit -- 11x 12x ... 55x 56x
      # Third digit will be equal to or greater than second digit -- 111 112 ...
    # Sum the digits of the numbers in the array above (transform the array)
    # Compare the sum to the desired_sum (constraint #1)
    # If they match, add the number to the array of possible solutions.

def last_digit(num)
  num.digits.first
end

def get_increasing_nums(digit_length)
  if digit_length == 1
    (1..9).to_a
  else
    get_increasing_nums(digit_length - 1).map do |tens|
      last_digit(tens).upto(9).with_object([]) do |ones, arr|
        arr << tens * 10 + ones
      end
    end.flatten
  end
end

def find_all(sum_dig, digs)
  nums = get_increasing_nums(digs)
  nums.select! do |num|
    num.digits.sum == sum_dig
  end
  nums.size == 0 ? [] : [nums.size, nums.first, nums.last]
end

p find_all(10, 3) == [8, 118, 334]
