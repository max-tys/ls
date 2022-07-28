# Flow Control

# Question 1
=begin
(32 * 4) >= 129 --- false
false != !true --- false
true == 4 --- false. 4 is true in a conditional only.
false == (847 == '874') --- true. int is not equal to string.
(!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false --- true
=end

# Question 2
=begin
def all_caps(string)
  string.upcase if string.length > 10
end

print "String please: "
string = gets.chomp
puts all_caps(string)
=end


# Question 3
=begin
def func(num)
  if num >= 100
    puts "#{num} is equal to or greater than 100."
  elsif num > 50
    puts "#{num} is greater than 50 and less than 100."
  else
    puts "#{num} is between 0 and 50."
  end
end

num = 0

loop do
  print "Give me a number between 0 and 100: "
  num = gets.chomp.to_f
  break if num >= 0
end

func(num)
=end

# Question 4
=begin
# Snippet 1
'4' == 4 ? puts("TRUE") : puts("FALSE")
#false

# Snippet 2
x = 2
if ((x * 3) / 2) == (4 + 4 - x - 3)
  puts "Did you get it right?"
else
  puts "Did you?"
end
#did you get it right?

# Snippet 3
y = 9
x = 10
if (x + 1) <= (y)
  puts "Alright."
elsif (x + 1) >= (y)
  puts "Alright now!"
elsif (y + 1) == x
  puts "ALRIGHT NOW!"
else
  puts "Alrighty!"
end
#Alright now!
=end

# Question 5
# exercise.rb:8: syntax error, unexpected end-of-input, expecting keyword_end
# There is a syntax error in the method.
# The if conditional should end with "end".

# Question 6
(32 * 4) >= "129" #error - cannot compare int with str
847 == '874' #false
'847' < '846' #false
'847' > '846' #true
'847' > '8478' #false
'847' < '8478' #true