# You are given array of integers,
# your task will be to count all pairs in that array and return their count.

# Input is an array of integers.
# Output is a count of all the pairs in the array.
# Data structure - arrays and hashes
# Approach
# Iterate over each number in the array.
# => On each iteration, count the number of occurrences of that num in the array.
# => Store the count in a hash
# Iterate over the hash
# => If any values are 2 or more, this indicates a pair in the array.
# => Increment the pair count by one.

def pairs(array)
  num_count = {}
  array.each do |num|
    num_count[num] = array.count(num)
  end

  pair_count = 0
  num_count.each_value do |value|
    pair_count += value / 2
  end

  pair_count
end

p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2])
