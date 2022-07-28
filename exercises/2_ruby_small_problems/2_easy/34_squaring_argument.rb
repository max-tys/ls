def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def exponential(base, exponent)
  answer = 1
  loop do
    break if exponent == 0
    answer = multiply(answer, base)
    exponent -= 1
  end
  answer
end

puts square(5) == 25
puts square(-8) == 64
puts exponential(3, 3) == 27
puts exponential(2, 6) == 64
puts exponential(10, 0) == 1
