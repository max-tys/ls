###############################
#  Practice Problems: Easy 1  #
###############################

=begin

# Question 1
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# [1, 2, 2, 3]

# Question 2

The ! operator is used in boolean expressions.
If you affix ! before an expression which evaluates to true,
the entire expression evaluates to false. The converse is true.
When used as part of a method name, it indicates that the method mutates the caller.

The ? operator is used in ternary expressions.
It is also used in method names to indicate that the method returns a boolean value.

1. what is != and where should you use it?
!= means 'not equal'. You use this in conditionals.

2. put ! before something, like !user_name
It would return false.

3. put ! after something, like words.uniq!
This mutates the caller.
The object referenced by the variable word is mutated.
It does not return a new string.

4. put ? before something
This is used in ternary operators.

5. put ? after something
Shows that the method returns a boolean value.

6. put !! before something, like !!user_name
Forces the expression to return a boolean value.

# Question 3

advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')
puts advice

# Question 4

numbers = [1, 2, 3, 4, 5]

p numbers.delete_at(1) # Deletes the element at index 1.
p numbers.delete(1) # Deletes all items that are equal to 1.

# Question 5
puts (10..100).to_a.include?(42)
# or (10..100).cover?(42)

# Question 6

famous_words = "seven years ago..."

famous_words = "Four score and " + famous_words
puts famous_words

famous_words = "Four score and " << famous_words
puts famous_words

famous_words.prepend("Four score and ")
puts famous_words

# Question 7

p ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]].flatten

# Question 8

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones.to_a[2]
# Correct answer: flintstones.assoc("Barney")

=end
