# ============
# STRINGS
# ============


# Question 1

s = String.new

# Question 2

puts "It\'s now 12 o\'clock."

# Question 3

name = 'Roger'
puts name.downcase == 'RoGeR'.downcase ? "true" : "false"
puts name.downcase == 'DAVE'.downcase ? "true" : "false"
puts name.casecmp('RoGeR') == 0
puts name.casecmp('DAVE') == 0

# Question 4
name = 'Elizabeth'

puts "Hello, #{name}!"

# Question 5
first_name = 'John'
last_name = 'Doe'
# full_name = first_name + ' ' + last_name
full_name = "#{first_name} #{last_name}"
puts full_name

# Question 6
state = 'tExAs'
state.capitalize!
puts state

# Question 7

greeting = 'Hello!'
greeting.replace('Goodbye!')
puts greeting
# Or you can use gsub which replaces every instance of a character/phrase.

# Question 8

alphabet = 'abcdefghijklmnopqrstuvwxyz'
puts alphabet.split('')
# .split('') separates individual characters.
# .split(//) also works

# Question 9

words = 'car human elephant airplane'
words.split.each { |word| puts "#{word}s" }

# Question 10

colors = 'blue pink yellow orange boredom'
puts colors.include?('yellow')
puts colors.include?('purple')
puts colors.include?('red') # outputs true. red is a substring of boredom.
