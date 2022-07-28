# Write a method that takes an Array of numbers
# and then returns the sum of the sums of each leading subsequence for that Array.
# You may assume that the Array always contains at least one number.

# Solution 1
# def sum_of_sums(array)
#   subsequences = []

#   index = 0
#   loop do
#     subsequences[index] = array[0, index + 1]

#     index += 1
#     break if index >= array.length
#   end

#   summed_subsequences = subsequences.map { |subsequence| subsequence.inject(:+) }

#   sum_total = summed_subsequences.inject(:+)
# end

# Solution 2 - with some simple arithmetics
# def sum_of_sums(array)
#   total = 0
#   index = 0

#   loop do
#     total += array[index] * (array.size - index)
#     index += 1
#     break if index >= array.size
#   end

#   total
# end

# Solution 3 - refactored solution 2

def sum_of_sums(array)
  array.inject(0) { |total, num| total + num * (array.size - array.index(num)) }
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
