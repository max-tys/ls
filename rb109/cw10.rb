# Complete the greatestProduct method
# so that it'll find the greatest product
# of five consecutive digits in the given string of digits.

# Input: A integer in the form of a string
# Output: An integer
# Data structures: String, array
# Algorithm:
# Initialize a variable to keep track of the greatest product
# Iterate over the integer five digits at a time
# => Convert the string into an array of digits to facilitate iteration
# Compute the product of the 5-digit number
# If the product is greater than greatest_product, reassign greatest_product
# Return greatest_product

# def greatestProduct(n)
#   greatest_product = 0
#   n = n.chars
#   n.each_index do |idx|
#     product = n[idx, 5].map(&:to_i).reduce(:*)
#     greatest_product = product if product > greatest_product
#     break if idx == n.length - 5
#   end
#   greatest_product
# end

def greatestProduct(n)
  n.to_i.digits.each_cons(5).map { |slice| slice.reduce(:*) }.max
end

p greatestProduct("123834539327238239583") #== 3240
