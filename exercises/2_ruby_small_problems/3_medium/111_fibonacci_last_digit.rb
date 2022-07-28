# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

def generate_fibonacci_last(n)
  first, second = [1, 1]

  3.upto(n) do
    first, second = [second % 10, (first + second) % 10]
  end

  second
end

def retrieve_fibonacci_last(n)
  last_digit = [0]

  1.upto(60) do |i|
    last_digit << generate_fibonacci_last(i)
  end

  generate_fibonacci_last(n % 60)
end

p retrieve_fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p retrieve_fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p retrieve_fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p retrieve_fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p retrieve_fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p retrieve_fibonacci_last(123_456_789) # -> 4
p retrieve_fibonacci_last(123_456_789_987_745) # -> 5
