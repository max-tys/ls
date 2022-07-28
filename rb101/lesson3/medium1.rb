#################################
#  Practice Problems: Medium 1  #
#################################

=begin
# Question 1
10.times { |i| puts (' ' * i) + "The Flintstones Rock!" }

# Question 2

puts "the value of 40 + 2 is " + (40 + 2)
# There is an error because you cannot concatenate an integer to a string.
# Solution 1 - convert 42 to a string with (40 + 2).to_s.
# Solution 2 - string interpolation i.e. #{40 + 2}

# Question 3

def factors(number)
  divisor = number
  factors = []
  loop do
    break if divisor <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# Bonus 1 - the purpose of number % divisor == 0
# This checks if the divisor is a factor of number. No remainder.

# Bonus 2 - purpose of the second last line
# This returns the factors array.

# Question 4

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# The << operator (aka the shovel) adds the new element to the buffer directly.
# The input argument called buffer will remain modified after def1 returns.

# The + operator returns a new string. ...
# ... We need to assign the new string to a variable to store it permanently.
# Also, this method does not alter the input argument.

# Question 5

limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# The method does not have access to the local variable called limit.
# The local variable is beyond the scope of the method.
# If Ben wishes to rely on a local variable in his method definition, ...
# he must do so by passing the local variable as an argument to the method def.
# Alternatively, he can initiate the limit variable within the method.

# Question 6

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# 34, being 42 - 8. Integers are immutable objects.
# When we pass answer as an argument to the method, ...
# ... we assign the parameter, some_number, to point to the number 42.
# With the += operator, we reassign some_number to point to a new number, 50.
# The answer variable continues to point to 42.

# Question 7
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

# munsters.values returns a new array containing all values in munster.
# We now have an array of five hashes, i.e. [{}, {}, {}, {}, {}]
# We then call the each method on the aforesaid array ...
# ... and increase the age and change the gender.
# The issue is whether this permanently changes the values in the munsters hash.
# We look at the documentation for Hash#[]=.
# As the keys exist, their values are replaced with the given value.
# Ruby passes the object_id of each argument to the method, not the value of the argument.
# demo_hash is pointing to the munster hash.
# The actual hash object inside the method is the munster hash.
# Hence, the family's data was ransacked.

# Question 8

# rps method returns the winning fist.
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# rps(rps("paper", "rock"), "rock")
# rps("paper", "rock")
# "paper"
# puts "paper" - outputs paper, returns nil.

# Question 9

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)

# bar(foo)
# We evaluate foo first.
# foo returns "yes" regardless of the argument.
# Thus, bar(foo) is equivalent to bar("yes")
# We next evaluate the expression param == "no".
# If we substitute param for "yes", the expression is now "yes" == "no"
# This expression returns a false boolean value.
# Hence, the ternary operator returns "no"
# This being the last expression of the bar method, bar returns "no".

=end
