# Write a method that takes an integer argument,
# and returns an Array of all integers, in sequence, between 1 and the argument.
# You may assume that the argument will always be a valid integer that is greater than 0.

# Original solution
# def sequence(num)
#   output = []
#   1.upto(num) { |i| output << i }
#   output
# end

# Further exploration
def sequence(num)
  num > 0 ? (1..num).to_a : (num..0).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-2) == [-2, -1, 0]
p sequence(0) == [0]
