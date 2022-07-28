# Sum of Pairs
# Given a list of integers and a single sum value,
# return the first two values (parse from the left please)
# in order of appearance that add up to form the sum.

# sum_pairs([11, 3, 7, 5],         10)
# #              ^--^      3 + 7 = 10
# == [3, 7]

# sum_pairs([4, 3, 2, 3, 4],         6)
# #          ^-----^         4 + 2 = 6, indices: 0, 2 *
# #             ^-----^      3 + 3 = 6, indices: 1, 3
# #                ^-----^   2 + 4 = 6, indices: 2, 4
# #  * entire pair is earlier, and therefore is the correct answer
# == [4, 2]

# sum_pairs([0, 0, -2, 3], 2)
# #  there are no pairs of values that can be added to produce 2.
# == None/nil/undefined (Based on the language)

# sum_pairs([10, 5, 2, 3, 7, 5],         10)
# #              ^-----------^   5 + 5 = 10, indices: 1, 5
# #                    ^--^      3 + 7 = 10, indices: 3, 4 *
# #  * entire pair is earlier, and therefore is the correct answer
# == [3, 7]
# Negative numbers and duplicate numbers can and will appear.

# Input - an array of integers
# Output - a sub-array containing 2 integers from the input array
# Data structure / algorithm
  # [10, 5, 2, 3, 7, 5]
  # -- (10, 5)
  # -- (10, 2), (5, 2)
  # -- (10, 3), (5, 3), (2, 3)
  # -- (10, 7), (5, 7), (2, 7), (3, 7)
  # -- (10, 5), (5, 5), (2, 5), (3, 5), (7, 5)
  # -- (5, 2)
  # -- (5, 3), (2, 3)
  # ...
  # -- (7, 5)
  # Use two counters to keep track of the first number and the second number
  # The counter for the second number lives in the outer loop (5, 2, 3, 7, 5)
  # The counter for the first number lives in the inner loop
  # => The counter in the inner loop is defined by the counter in the outer loop
  # => If the second counter points us to the position of the last number in each pair,
  # => the first counter will always point to an index smaller than the second counter
  # We will have to loop over the array twice
  # On each iteration, we add up the values and check if it is equal to the desired sum
  # If so, we can return the values in the form of an array immediately
  # If we cannot find any such pairs, return nil.

# Inefficient solution
# def sum_pairs(ints, s)
#   1.upto(ints.length - 1) do |last_idx|
#     0.upto(last_idx - 1) do |first_idx|
#       return [ints[first_idx], ints[last_idx]] if ints[first_idx] + ints[last_idx] == s
#     end
#   end
#   nil
# end

# Algorithm
  # Create a hash to keep track of whether we've checked a given number
  # Iterate over the numbers in the array
  # Add the number to the hash to indicate that we've come across it
  # Check if we've come across any other number that would produce the sum of 10
  # If so, we will return the pair
  # Return nil at the end of the iteration.

def sum_pairs(ints, s)
  seen = {} # Hash table lookups take O(1)
  ints.each do |num| # O(n)
    return [(s - num), num] if seen[s - num]
    seen[num] = true
  end
  nil
end

p sum_pairs([4, 3, 2, 3, 4], 6)
p sum_pairs([0, 0, -2, 3], 2)
