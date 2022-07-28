# There is an array with some numbers. All numbers are equal except for one. Try to find it!

# find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
# find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
# It’s guaranteed that array contains at least 3 numbers.

# The tests contain some very huge arrays, so think about performance.

# Input is an array of numbers
# Output is a number from the input array - this is a unique number
# Data structure / algorithm
  # Sort the array
  # Check if the first and last elements are unique
  # An element is unique if it only occurs once in the array
  # Return the unique number

# def find_uniq(arr)
#   arr = arr.sort
#   return arr[0] if arr.count(arr[0]) == 1
#   return arr[-1] if arr.count(arr[-1]) == 1
# end

# Data structure / algorithm
  # Remove duplicate values from the array (non-mutating)
  # Count the number of occurrences of each different number
  # Return the number that only occurs once in the original array

def find_uniq(arr)
  arr.uniq.select { |n| arr.count(n) == 1 }[0]
end
