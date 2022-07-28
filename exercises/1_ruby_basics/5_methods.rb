# ============
# METHODS
# ============

# Question 1
def print_me
  puts "I'm printing within the method!"
end

print_me

# Question 2

def print_me
  "I'm printing the return value!"
end

puts print_me

# Question 3
def hello
  "Hello"
end

def world
  "World"
end

puts "#{hello} #{world}"


# Question 4

def hello
  'Hello'
end

def world
  'World'
end

def greet
  hello + ' ' + world
end

puts greet


# Question 5
def car(make, model)
  "#{make} #{model}"
end

puts car('Toyota', 'Corolla')

# Question 6

def time_of_day(bool)
  puts bool ? "It's daytime!" : "It's nighttime!"
end

daylight = [true, false].sample # Define methods before initialising variables

time_of_day(daylight)

# Question 7

def dog(name)
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog("Spot")}."
puts "The cat's name is #{cat("Ginger")}."

# Question 8

def assign_name(name='Bob') # Default parameter is 'Bob'
  name
end

puts assign_name('Kevin') == 'Kevin'
puts assign_name == 'Bob'

# Question 9

def add(n1, n2)
  n1 + n2
end

def multiply(n1, n2)
  n1 * n2
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36
# Question 10

def name(array)
  array.sample
end

def activity(array)
  array.sample
end

def sentence(name, activity)
  name + ' went ' + activity + ' today!'
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

10.times { puts sentence(name(names), activity(activities)) }
