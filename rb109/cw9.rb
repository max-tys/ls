# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.
# Additionally, if the number is negative, return 0 (for languages that do have them).
# Note: If the number is a multiple of both 3 and 5, only count it once.

# Input - an integer
# Output - an integer, sum of all the multiples of 3 + sum of multiples of 5
# Data structure - integers and arrays of integers
# Algorithm
# Return 0 if the input number is < 0.
# List all the integers below the input number that are multiples of 3 or 5
# => Add multiples of 3 to the list
# => Add multiples of 5 to the list
# => Remove any duplicate numbers from the list (i.e. multiples of 15)
# Total up the numbers in the list, return the sum.

def solution(number)
  return 0 if number < 0
  multiples = []
  1.upto(number - 1) do |num|
    multiples << num if num % 3 == 0 || num % 5 == 0
  end
  multiples.uniq.sum
end

p solution(10) == 23
p solution(20) == 78
