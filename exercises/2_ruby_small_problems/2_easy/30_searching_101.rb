def input_prompt(order)
  puts "==> Enter the #{order} number:"
end

ordinal_numbers = %w(1st 2nd 3rd 4th 5th)

five_numbers = []

ordinal_numbers.each do |i|
  input_prompt(i)
  five_numbers << gets.to_i
end

input_prompt('last')
search_term = gets.to_i

if five_numbers.include?(search_term)
  puts "The number #{search_term} appears in #{five_numbers}."
else
  puts "The number #{search_term} does not appear in #{five_numbers}."
end
