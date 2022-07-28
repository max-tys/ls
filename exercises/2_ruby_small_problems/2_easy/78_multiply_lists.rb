# Write a method that takes two Array arguments
# in which each Array contains a list of numbers,
# and returns a new Array
# that contains the product of each pair of numbers
# from the arguments that have the same index.
# You may assume that the arguments contain the same number of elements.

# Original solution
# def multiply_list(arr1, arr2)
#   output = []

#   pairs = arr1.zip(arr2)

#   pairs.each do |pair|
#     output << pair[0] * pair[1]
#   end

#   output
# end

# Refactored solution
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |pair| pair[0] * pair[1] }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
