# Define the first 2 Fibonacci numbers in an array - 1, 1
# Start looping.
# Generate the next Fibonacci number by adding the previous two numbers.
# Check the number of digits of the new number by finding log base 10.
# If the length of the new number is equal to the parameter, quit the loop.
# If not, we continue generating Fibonacci numbers.
# Return the index of the new number in the array.

# Original solution.
# Not ideal. We are storing all the Fibonacci numbers, which is not necessary.
def find_fibonacci_index_by_length(desired_length)
  fibonacci = [1, 1]
  index = 2
  loop do
    fibonacci[index] = fibonacci[index - 2] + fibonacci[index - 1]
    length = Math.log(fibonacci[index], 10).to_i + 1 # log10 6 = 0, log10 16 = 1
    break if length == desired_length
    index += 1
  end
  index + 1 # The real world index starts from 1.
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
