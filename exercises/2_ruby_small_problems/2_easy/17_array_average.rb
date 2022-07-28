def average(numbers)
  total = 0
  numbers.each { |number| total += number } # Or use Enumerable#reduce
  average = total / numbers.size
  # Use the code below for a more precise answer.
  # average = total.to_f / numbers.size.to_f
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
