# Input: an array of integers
# Output: an integer that represents the index of N
# => sum of integers on N's left == sum of integers on N's right

# Data structure: arrays
# Algorithm
# => Iterate through the array, starting from the first element.
# => First element will be our marker.
# => Compare sub-array on the left and sub-array on the right
# => Both sub-arrays will not include the element in iteration
# => If both sides are evenly balanced, we will return the element's position
# => Return -1 if there is no index where both sides are evenly balanced.

def find_even_index(arr)
  arr.each_with_index do |num, idx|
    return idx if arr[0...idx].sum == arr[(idx + 1)..-1].sum
  end
  -1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
