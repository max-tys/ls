# Grouping and Counting

# Your goal is to write the group_and_count method,
# which should receive an array as a unique parameter and return a hash.
# Empty or nil inputs must return nil instead of a hash.
# This hash returned must contain as keys the unique values of the array,
# and as values the counting of each value.

# Example usage:
# input = [1,1,2,2,2,3]
# group_and_count(input)# == {1=>2, 2=>3, 3=>1}
# The following methods were disabled:
# Array#count
# Array#length

# Input is an array of numbers
# Output is a hash if the array is not empty
  # The keys of the hash are the unique values of the array
  # The values of the hash are the count of each value in the array.
  # Output is nil if the array is empty
# Algorithm
  # Initialize the hash (num_count). All values are set to 0 by default
  # Iterate over the original array.
  # On each iteration, increment the value of the count[num] key by one.
    # num_count[1] += 1 # { 1 => 2 }
  # Return the hash (unless we were given an empty array or nil input)

def group_and_count(input)
  return nil if input == nil || input.empty?
  input.each_with_object(Hash.new(0)) { |num, hsh| hsh[num] += 1 }
end

