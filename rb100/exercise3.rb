# Question 1
def greeting(name)
  "How are you today, " + name + "?"
end

puts greeting("Max")

# Question 2
# x = 2 evaluates to (or returns) 2.
# puts x = 2 evaluates to nil.
# p name = "Joe" evaluates to "Joe".
# four = "four" evaluates to "four".
# print something = "nothing" evaluates to nil.

# Question 3
def multiply(num1, num2)
  num1 * num2
end

# Question 4
# This code will not print anything to the screen.
# The return keyword was explicitly called in the method,
# before we even got to print or puts anything.
# Ruby exits the method immediately when it sees "return".

# Question 5
def scream(words)
  words = words + "!!!!"
  puts words
end

scream("Yippeee")
# The method prints "Yippeee!!!!" but returns nil.

# Question 6
# The error lies in the number of arguments.
# The method requires two arguments.
# But we only gave the method one argument.