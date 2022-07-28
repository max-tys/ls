def validate_non_zero_integer(input)
  return false if input <= 0
  input.to_s.to_i == input
end

def validate_operator(input)
  (input == 's') || (input == 'p')
end

def sum(number)
  (1..number).to_a.reduce(:+)
end

def product(number)
  (1..number).to_a.reduce(:*)
end

number = ''
loop do
  puts '>> Please enter an integer greater than 0:'
  number = gets.to_i
  break if validate_non_zero_integer(number)
  puts '>> Invalid input. Please try again.'
end

operator = ''
loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  operator = gets.chomp
  break if validate_operator(operator)
  puts '>> Invalid input. Please try again.'
end

if operator == 's'
  puts ">> The sum of the integers"\
        " between 1 and #{number} is #{sum(number)}."
else
  puts ">> The product of the integers"\
        " between 1 and #{number} is #{product(number)}."
end
