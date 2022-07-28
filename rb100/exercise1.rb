# Question 1
name = "Max" + "Tan"

# Question 2
original_num = 3249
num_1 = original_num / 1000
num_2 = (original_num % 1000) / 100
num_3 = (original_num % 100) / 10
num_4 = original_num % 10

# Question 3
movies = {
  "The Shawshank Redemption": "1994",
  "The Godfather": "1972",
  "The Dark Knight": "2008",
  "12 Angry Men": "1957",
  "LOTR: The Return of the King": "2003"
}
movies.each { |title, year| puts year }

# Question 4
movies_array = []
movies.each do |title, year|
  movies_array << year
end
puts movies_array

# Question 5
# Convert a range of values to an array
# Inject applies a function to all elements in the array
puts (1..8).to_a.inject(1) { |result, num| result * num }

# Question 6
def square(num)
  num * num
end
puts square(0.5)

# Question 7
# There is a syntax error at line 2 of irb.
# We should have used '}' instead of ')'.