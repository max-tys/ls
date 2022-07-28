# =============
#    LOOPS 1
# =============

# Question 1

loop do
  puts 'Just keep printing...'
  break
end

# Question 2

loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end
  break
end

puts 'This is outside all loops.'

# Question 3

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break if iterations == 5
  iterations += 1
end

# Question 4

loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
  puts 'Type "yes" if you want to stop looping.'
end

# Question 5

say_hello = true

n = 0

while say_hello
  puts 'Hello!'
  n += 1
  say_hello = false if n == 5
end


# Question 6

numbers = []
while numbers.size < 5
  numbers << rand(100)
end
puts numbers

# Question 7

count = 1

until count > 10
  puts count
  count += 1
end

# Question 8

numbers = [7, 9, 13, 25, 18]
until numbers.size == 0
  puts numbers.shift
end

# Question 9

for i in 1..100
  puts i if i % 2 != 0
end

# Question 10

friends = ['Sarah', 'John', 'Hannah', 'Dave']
for i in 0...friends.size
  puts "Hello, #{friends[i]}!"
  i += 1
end

# =============
#    LOOPS 2
# =============

# Question 1
count = 1

loop do
  if count.odd?
    puts "#{count} is odd!"
  else
    puts "#{count} is even!"
  end
  count += 1
  break if count > 5
end

# Question 2

loop do
  number = rand(100)
  puts number
  break if number <= 10 # You can use the between method also.
end

# Question 3

process_the_loop = [true, false].sample
if process_the_loop
  loop do
    puts "The loop was processed"
    break
  end
else
  puts "The loop wasn't processed"
end

# Question 4

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i

  if answer == 4
    puts "That's correct"
    break
  else
    puts "Wrong answer. Try again!"
  end

end

# Question 5

numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers << input # << accepts a single argument. push accepts > 1 args.
  break if numbers.size == 5
end
puts numbers

# Question 6

names = ['Sally', 'Joe', 'Lisa', 'Henry']
loop do
  puts names.pop
  break if names.empty?
end

# Question 7

5.times do |index|
  puts index
  break if index == 2
end

# Question 8

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

# Question 9

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  # puts "a is #{number_a}, b is #{number_b}"
  next unless number_a == 5 || number_b == 5
  puts "5 was reached!"
  break
  # if a == 5 || b == 5
  #   puts "5 was reached!"
  #   break
  # end
end

# Question 10

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings != 0
  greeting
  number_of_greetings -= 1
end
