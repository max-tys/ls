# ============
# CONDITIONALS
# ============

# Question 1

sun = ['visible', 'hidden'].sample
puts 'The sun is so bright!' if sun == 'visible'

# Question 2

sun = ['visible', 'hidden'].sample
puts 'The clouds are blocking the sun!' unless sun == 'visible'

# Question 3
sun = ['visible', 'hidden'].sample
puts 'The sun is so bright!' if sun == 'visible'
puts 'The clouds are blocking the sun!' unless sun == 'visible'

# Question 4
boolean = [true, false].sample
puts boolean ? "I'm true!" : "I'm false!"
# Suggested ans: boolean ? puts("i'm true") : puts("i'm false")

# Question 5

number = 7

if number
  puts "My favorite number is #{number}."
else
  puts "I don't have a favorite number."
end
# Prints the if block - my fave no is 7.
# 7 is a truthy value.
# Everything is truthy except for false and nil/

# Question 6

stoplight = ['green', 'yellow', 'red'].sample
case stoplight
when 'green'
  puts 'Go!'
when 'yellow'
  puts 'Slow down!'
when 'red'
  puts 'Stop!'
end

# Question 7

stoplight = ['green', 'yellow', 'red'].sample

if stoplight == 'green'
  puts 'Go!'
elsif stoplight == 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end
# case statement is useful for comparing multiple values to the same case.

# Question 8

status = ['awake', 'tired'].sample

var = if status == 'awake'
        "Be productive!"
      else
        "Go to sleep!"
      end

puts var

# Question 9

number = rand(10)

if number == 5
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end

# Question 10

stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'  then puts 'Go!'
when 'yellow' then puts 'Slow down!'
else               puts 'Stop!'
end
