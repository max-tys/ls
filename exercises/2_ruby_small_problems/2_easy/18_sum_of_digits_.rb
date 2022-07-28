# Solution with an each loop.
=begin
def sum(number)
  array_numbers = number.to_s.split(//)
  sum = 0
  array_numbers.each { |number| sum += number.to_i }
  sum
end
=end

# Solution without any basic looping constructs
def sum(number)
  # Convert the array of strings to an array of integers with shorthand syntax.
  array_numbers = number.to_s.chars.map(&:to_i)

  # Sum up the array of integers.
  return sum = array_numbers.reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
