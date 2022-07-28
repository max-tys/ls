# A featured number (something unique to this exercise)
# is an odd number that is a multiple of 7,
# and whose digits occur exactly once each.
# So, for example, 49 is a featured number,
# but 98 is not (it is not odd),
# 97 is not (it is not a multiple of 7),
# and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument,
# and returns the next featured number that is greater than the argument.
# Return an error message if there is no next featured number.

MAX_NUM = 9_876_543_210

def mult_seven?(num)
  num % 7 == 0
end

def uniq_nums?(num)
  # Array#uniq! returns nil if there are no duplicates.
  ! num.digits.uniq!
end

def featured?(num)
  mult_seven?(num) && uniq_nums?(num) && num.odd?
end

def next_featured(num)
  num += 1
  num += 1 until num.odd? && mult_seven?(num)

  loop do
    return num if uniq_nums?(num)
    num += 14
    break if num >= MAX_NUM
  end

  "There is no possible number that fulfills those requirements."
end

# p next_featured(12) == 21
# p next_featured(20) == 21
# p next_featured(21) == 35
# # p next_featured(997) == 1029
# p next_featured(1029) == 1043
# p next_featured(999_999) == 1_023_547
# p next_featured(999_999_987) == 1_023_456_987
# p next_featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
