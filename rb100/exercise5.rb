# Loops & Iterators

# Question 1
=begin
x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end
=end

# The each method will always return the original array.
# See documentation: https://ruby-doc.org/core-2.7.0/Array.html#method-i-each
# Calls the given block once for each element in self, 
# passing that element as a parameter. 
# Returns the array itself.

# Question 2
=begin
while true
  puts 'This is an infinite while loop.'
  print 'Type "STOP" if you want this loop to stop. '
  input = gets.chomp
  if input == "STOP"
    puts "Ending the loop..."
    break
  else
    puts "The loop continues..."
  end
end
=end

# Question 3
=begin
def countdown(num)
  return num if num < 0 # no negative numbers allowed
  puts num
  countdown(num - 1) if num > 0
end

countdown(-5) # will return -5
=end