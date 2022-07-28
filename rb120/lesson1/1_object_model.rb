# How do we create an object in Ruby? Give an example of the creation of an object.

# What is a module? What is its purpose? How do we use them with our classes?
# Create a module for the class you created in exercise 1 and include it properly.

module Tricks
  def speak
    puts "Woof!"
  end
end

class GoodGirl
  include Tricks
end

muffin = GoodGirl.new
muffin.speak


# Implementing Enumerable#tally with Enumerable#each_with_object

string = 'aa.bbb.111.2222.33333'
characters = string.chars

tally = characters.each_with_object({}) do |char, hash|
	hash[char] = characters.count(char)
end

p tally