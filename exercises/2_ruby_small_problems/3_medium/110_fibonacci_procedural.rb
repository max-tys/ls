def fibonacci(n)
  return 1 if n <= 2

  f = [0, 1, 1]

  (n - 2).times do
    f.shift
    f << (f[0] + f[1])
  end

  f.last
end

p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
