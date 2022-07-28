# You are going to be given an array of integers.
# Your job is to take that array
# and find an index N
# where the sum of the integers to the left of N
# is equal to the sum of the integers to the right of N.
# If there is no index that would make this happen, return -1.

# Input: An array of integers
# Output: An integer - index of the array - sum of both sides are equal
# Data structure - arrays, integers
# Algorithm
# Iterate through the array - iterate using the index, not the element
# As we iterate through the array,
# we create a sub-array to the left of N
# we create a sub-array to the right of N
# Compare the sum of integers on both sides
# If both sums are the same, return N
# Return -1 at the end of the method - in case we cannot find an index that balances both sides

def find_even_index(arr)
  arr.each_index do |idx|
    return idx if arr[0...idx].sum == arr[(idx + 1)..-1].sum
  end
  -1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
