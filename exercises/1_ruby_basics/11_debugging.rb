# ============
# DEBUGGING
# ============

# Question 1

#find_first_nonzero_among(0, 0, 1, 0, 2, 0)
# /home/ec2-user/environment/ruby_basics/exercise_basics.rb:1104:in `find_first_nonzero_among': wrong number of arguments (given 6, expected 1) (ArgumentError)
# Argument Error. The method takes one argument. We gave it six.

#find_first_nonzero_among(1)
# /home/ec2-user/environment/ruby_basics/exercise_basics.rb:1111:in `find_first_nonzero_among': undefined method `each' for 1:Integer (NoMethodError)
# No Method Error. You cannot use the each method on an integer.

# Question 2
def predict_weather
  sunshine = [true, false].sample

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

# Both 'true' and 'false' are truthy values.

# Question 3

def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp.to_i
# All user inputs are strings by default.
# Without .to_i, number is assigned to a string.

puts "The result is #{multiply_by_five(number)}!"


# Question 4

pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog] << 'bowser'
# pets[:dog] = 'bowser' if you use =, you overwrite the values in pets.

# Question 5

numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.select do |n|
  n.even?
end

p even_numbers # expected output: [2, 6, 8]

# Array#map is used for transforming the entire array.
# n if n.even? returns nil if it is odd.

# Question 6

def get_quote(person)
  if person == 'Yoda'
    return 'Do. Or do not. There is no try.'
  end

  if person == 'Confucius'
    return 'I hear and I forget. I see and I remember. I do and I understand.'
  end

  if person == 'Einstein'
    return 'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'

# Without an explicit return statement, the method returns the last line.
# The method evaluates all three if statements.
# An if statement returns nil if the condition is false.

# Question 7

# Financially, you started the year with a clean slate.

balance = 0

# Here's what you earned and spent during the first three months.

january = {
  income: [ 1200, 75 ],
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
}

february = {
  income: [ 1200 ],
  expenses: [ 650, 140, 320, 46.7, 122.5 ]
}

march = {
  income: [ 1200, 10, 75 ],
  expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
}

# Let's see how much you've got now...

def calculate_balance(month)
  plus  = month[:income].sum
  minus = month[:expenses].sum

  plus - minus
end

[january, february, march].each do |month|
  balance += calculate_balance(month)
end

puts balance

# By using the assignment operator, you override the variable balance
# each time you run the calculate_balance method.

# Question 8

colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i == colors.length || i == things.length

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end

# The colors array has 8 elements, but the things array only has 7 elements.
# The 8th element of array does not exist. It is nil.
# You cannot convert nil into a string.
# We can either add an element to the things array or remove an element from the colors array.
# We also should not run the loop anymore if we exhaust all the elements in the arrays.

# Question 9

def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 1 # You should not initialise the product variable to 0.

  digits.each do |digit|
    product *= digit
  end

  product
end


p digit_product('12345')
# expected return value: 120
# actual return value: 0

# Question 10

# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase.to_sym

player.merge!(character_classes[input])
# First bug - we need to use the destructive version of merge.
# Second bug - we need to provide a symbol as the key to the cc hash.

puts 'Your character stats:'
puts player
=end
