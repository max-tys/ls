# ===========
# USER INPUT
# ===========

# Question 1

puts "Type anything you want:"
input = gets.chomp
puts input

# Question 2

puts ">> What is your age in years?"
age = gets.chomp.to_i
puts "You are #{age * 12} months old."

# Question 3

puts ">> Do you want me to print something? (y/n)"
input = gets.chomp
puts "something" if input.downcase == "y"

# Question 4

loop do
  puts ">> Do you want me to print something? (y/n)"
  input = gets.chomp
  if input.downcase == 'y'
    puts 'something'
    break
  elsif input.downcase == 'n' # Consider using .include
    break
  else
    puts 'Invalid input. Please enter y or n.'
  end
end

# Question 5
num = 0
loop do
  puts ">> How many output lines do you want? Enter a number >= 3:"
  num = gets.chomp.to_i
  break if num >= 3
  puts "That's not enough lines."
end
num.times { puts 'Launch School is the best!' }

# Question 6

PASS = 'password123'
loop do
  puts ">> Please enter your password:"
  user_pw = gets.chomp
  break if user_pw == PASS
  puts ">> Invalid password!"
end
puts "Welcome!"

# Question 7
USER = 'admin'
PASSWORD = 'password123'
loop do
  puts ">> Please enter your username:"
  user = gets.chomp
  puts ">> Please enter your password:"
  password = gets.chomp
  break if user == USER && password == PASSWORD
  puts ">> Authorization failed!"
end
puts "Welcome!"

# Question 8

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = 0
loop do
  puts ">> Please enter the numerator:"
  numerator = gets.chomp
  break if valid_number?(numerator)
  puts "Invalid input. Only integers are allowed."
end

denominator = 0
loop do
  puts ">> Please enter the denominator:"
  denominator = gets.chomp
  if denominator == '0'
    puts "Invalid input. A denominator of 0 is not allowed."
  elsif !valid_number?(denominator)
    puts "Invalid input. Only integers are allowed."
  else
    break
  end
end

answer = numerator.to_f / denominator.to_f

puts "#{numerator} / #{denominator} is #{answer.round(2)}."

# Question 9

loop do
  input = 0
  loop do
    puts ">> How many output lines do you want? Enter a number >= 3: (Q to quit)"
    input = gets.chomp
    break if input.to_i >= 3 || input.downcase == 'q'
    puts "That's not enough lines."
  end

  break if input.downcase == 'q'
  input.to_i.times { puts 'Launch School is the best!' }
end

# Question 10

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_int
  loop do
    puts ">> Please enter a positive or negative integer:"
    input = gets.chomp
    return input.to_i if valid_number?(input)
    puts ">> Invalid input. Only non-zero integers are allowed."
  end
end

int1 = 0
int2 = 0

loop do
  int1 = get_int
  int2 = get_int
  break if (int1 < 0 && int2 > 0) || (int1 > 0 && int2 < 0)
  puts ">> Sorry. One integer must be positive, one must be negative."
  puts ">> Please start over."
end

answer = int1 + int2
puts "#{int1} + #{int2} = #{answer}"
