# Given an array of integers, find the one that appears an odd number of times.
# There will always be only one integer that appears an odd number of times.

# Examples
# [7] should return 7, because it occurs 1 time (which is odd).
# [0] should return 0, because it occurs 1 time (which is odd).
# [1,1,2] should return 2, because it occurs 1 time (which is odd).
# [0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
# [1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).

# Input is an array of integers
# Output is an integer from the input array that appears an odd number of times

# Data structure / algorithm
# Iterate over an array of unique integers
# Count the number of times the integer appears in the original array
# Return the integer if it occurs an odd number of times

def find_it(seq)
  seq.uniq.each { |num| return num if seq.count(num).odd? }
end
