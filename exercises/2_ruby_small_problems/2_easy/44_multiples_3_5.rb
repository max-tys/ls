# Original solution

=begin
def multisum(num)
  total = 0
  (1..num).each { |i| total += i if (i % 3 == 0) || (i % 5 == 0) }
  total
end
=end

# Alternative solution for further exploration

def multisum(num)
  (1..num).inject(0) { |sum, i| (i % 3 == 0) || (i % 5 == 0) ? sum + i : sum }
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
