###############################
#  Practice Problems: Hard 1  #
###############################
=begin
# Question 1

if false
  greeting = "hello world"
end

greeting

# greeting returns nil.
# greeting is initialized within the if block.
# since the if block was not executed, the local variable is initialized to nil.

# Question 2

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # => { a: 'hi there' }
# informal_greeting references the value of the a key in the greetings hash.
# informal_greeting points to the value of the a key in the greetings hash.
# informal_greeting is a reference to the original object.
# when the << operator is applied to informal_greeting, ...
# ... it operates directly on the object that informal_greeting points to.
# The String#<< method modifies the object that called it.
# In this case, the object is the value of the a key.
# This changes the value of the greetings hash.

# Question 3A

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # 'one'
puts "two is: #{two}" # 'two'
puts "three is: #{three}" # 'three'

# Question 3B

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # 'one'
puts "two is: #{two}" # 'two'
puts "three is: #{three}" # 'three'

# Question 3C

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # 'two'
puts "two is: #{two}" # 'three'
puts "three is: #{three}" # 'one'

# Question 4

def is_an_ip_number?(string)
  return false if string.to_i.to_s != string
  (0..255).to_a.include?(string.to_i)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  component = 0
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    is_an_ip_number?(word) ? component += 1 : break
  end
  component == 4
end

puts dot_separated_ip_address?('555.0.0.1') == false
puts dot_separated_ip_address?('255.0.0.1') == true
puts dot_separated_ip_address?('255.255.255.255') == true
puts dot_separated_ip_address?('') == false
puts dot_separated_ip_address?('1.0') == false
puts dot_separated_ip_address?('1.0.5') == false
puts dot_separated_ip_address?('4.5.5') == false
puts dot_separated_ip_address?('1.2.3.4.5') == false
puts dot_separated_ip_address?('2555.0.0.1') == false
puts dot_separated_ip_address?('12...34') == false
puts dot_separated_ip_address?('...1234') == false
puts dot_separated_ip_address?('.12.34.') == false

=end
