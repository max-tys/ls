# ============
# HASHES
# ============

# Question 1

car = {
  type:     "sedan",
  color:    "blue",
  mileage:  80_000
}

# Question 2

car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000,
}

car[:year] = 2003

# Question 3

car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000,
  year:    2003
}

car.delete(:mileage)

# Question 4

car = {
  type:    'sedan',
  color:   'blue',
  year:    2003
}

puts car[:color]

# Question 5

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

numbers.each { |k,v| puts "A #{k} number is #{v}." }
# each returns self.

# Question 6

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

half_numbers = numbers.map { |k,v| v / 2 } # Returns an array, not a hash.
p half_numbers

# Question 7

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select { |k,v| v < 25 } # Returns a new Hash object.
p low_numbers

# Question 8

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select! do |key, value|
                 value < 25
               end
# We have created an alias for numbers.
# low_numbers and numbers point to the same Hash.
p low_numbers
p numbers

# Question 9

vehicles = {
  car: {
    type:   'sedan',
    color:  'blue',
    year:   2003
  },
  truck: {
    type:   'pickup',
    color:  'red',
    year:   1998
  }
}

# Question 10

car = [[:type, 'sedan'], [:color, 'blue'], [:year, 2003]]
# Arrays are preferred for ordered lists.
# Hashes are useful when your values require labels.
