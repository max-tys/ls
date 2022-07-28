# Write two methods:
#   one that takes a Rational number as an argument,
#     and returns an Array of the denominators
#     that are part of an Egyptian Fraction representation of the number,
#   and another that takes an Array of numbers in the same format,
#     and calculates the resulting Rational number.
# You will need to use the Rational class provided by Ruby.

# Loop through all unit fractions, incrementing denominator by 1 each time.
# Subtract the unit fraction from the input number if input number is bigger.
# Add the denominator of the unit fraction to the output array.
# Break the loop if the input number is 0.
def egyptian(rational_num)
  output = []

  denominator = 1
  loop do
    eg_fraction = Rational(1, denominator)

    if rational_num >= eg_fraction
      rational_num -= eg_fraction
      output << denominator
    end

    break if rational_num == 0

    denominator += 1
  end

  output
end

# Convert an array of denominators into unit fractions.
# Return the sum of the unit fractions.
def unegyptian(array)
  array.map! do |denominator|
    Rational(1, denominator)
  end.sum
end

# p egyptian(Rational(2, 1)) == [1, 2, 3, 6]
# p egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
# p egyptian(Rational(3, 1)) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

# p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
# p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
# p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
# p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
# p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
# p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
# p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
# p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)