# Question 1
print "What is your name? "
name = gets.chomp
puts "Greetings, #{name}!"

# Question 2
print "How old are you? "
age = gets.chomp.to_i
(10..40).step(10).to_a.each do |year|
  puts "In #{year} years you will be: #{year + age}"
end

# Question 3
print "What is your name? "
name = gets.chomp
10.times { print name + " " }

# Question 4
print "What is your first name? "
first_name = gets.chomp
print "What is your last name? "
last_name = gets.chomp
puts "Your name is #{first_name} #{last_name}."

# Question 5
# The first program prints "3" to the screen.
# There is a scope error with the second program.
# The variable x does not exist outside the 3.times method.