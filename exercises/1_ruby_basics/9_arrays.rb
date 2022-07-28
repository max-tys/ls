# ============
# ARRAYS
# ============

# Question 1

pets = ['cat', 'dog', 'fish', 'lizard']
my_pet = pets[2]
puts "I have a pet #{my_pet}!"

# Question 2

pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = []
my_pets.push(pets[2], pets[3]) # or pets[2..3]
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"

# Question 3

pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop
puts "I have a pet #{my_pets[0]}!"

# Question 4

pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop
my_pets << pets[1]
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"

# Question 5

colors = ['red', 'yellow', 'purple', 'green']
colors.each { |color| puts "I'm the color #{color}!" }

# Question 6

numbers = [1, 2, 3, 4, 5]
doubled_numbers = numbers.map { |number| number * 2 }
p doubled_numbers

# Question 7

numbers = [5, 9, 21, 26, 39]
divisible_by_three = numbers.select { |number| number % 3 == 0 }
p divisible_by_three

# Question 8

['Dave', 7, 'Miranda', 3, 'Jason', 11]
[['Dave', 7], ['Miranda', 3], ['Jason', 11]]

# Question 9
favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
p favorites.flatten

# Question 10

array1 = [1, 5, 9]
array2 = [1, 9, 5]
puts array1 == array2
