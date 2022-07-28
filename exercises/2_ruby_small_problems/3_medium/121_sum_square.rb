# Write a method that computes the difference
#   between the square of the sum of the first n positive integers
#   and the sum of the squares of the first n positive integers.

# Sums the first n positive integers
def square_sum(num)
  # (1..num).to_a.sum
  ((1 + num) * (num.to_f / 2)) ** 2
end

# Sum of squares of first n positive integers.
def sum_squares(num)
  integers = (1..num).to_a
  integers.map! do |int|
    int ** 2
  end.sum
end

def sum_square_difference(num)
  square_sum(num) - sum_squares(num)
end

p sum_square_difference(3) == 22
#   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
