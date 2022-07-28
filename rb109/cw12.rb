# Given a List [] of n integers ,
# find minimum number to be inserted in a list,
# so that sum of all elements of list should equal the closest prime number .

# Input: Array of integers
# Output: A single integer
# => Sum of integers in the array, incl the output integer, equals closest prime number
# Data structure - arrays
# Algorithm
# Implement a helper method that, given a number, finds the next closest prime number (prime)
# Helper method within the helper method - is a number prime?
# => A number is prime if the only factors are itself and 1.
# => 14 is not prime because it can be divided by 2 and 7.
# => 13 is prime because it can only be divided by 1 and 13.
# => Iterate from 2 to (input number / 2)
# => Return false if we find any factors of the number that is not itself or 1.
# Sum all integers in the input array (sum)
# Return prime - sum. This will be the minimum number to be inserted in the list.

def is_prime?(number)
  2.upto(number / 2) { |n| return false if number % n == 0 }
  true
end

def minimum_number(numbers)
  next_prime = numbers.sum
  loop do
    break if is_prime?(next_prime)
    next_prime += 1
  end
  next_prime - numbers.sum
end

p minimum_number([2,333,5,239])
