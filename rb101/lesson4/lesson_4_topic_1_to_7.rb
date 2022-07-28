##############
# 3. Looping #
##############

=begin
loop do
  number = rand(1..10)   # a random number between 1 and 10
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break
  end
end
=end

####################################
# 4. Introduction to PEDAC process #
####################################

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# Input: string
# Output: an array of substrings
# Rules:
#   Explicit requirements
#   - Every substring that is a palindrome must be extracted into an array
#   - Palindromes are case sensitive
#   Implicit requirements
#   - If the string is an empty string, the result should be an empty array
#   - Substrings of substrings are to be extracted too
#   - For substrings that contain palindromic substrings, the outermost ...
#   - ...substring should be listed in the array first.

# Pseudocode for extracting substrings from a string
# Start with the first character of the string.
# Extract the first substring that is two characters long.
# Continue extracting subsequent substrings until you hit the second last char.
# This is the first inner loop.
# Continue doing so for every subsequent character of the string.
# Quit the outer loop when you finish the inner loop for the second last char.

###################################
# 7. Selection and Transformation #
###################################

# Question 1 - Select key-value pairs whose values are 'Fruit'.

=begin
def select_fruit(food_hash)
  food_hash.select { |_, value| value == 'Fruit' }
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
=end

# Question 2 - Double all the numbers in an array. Return the mutated array.

=begin
def double_numbers!(array)
  index = 0

  loop do
    break if index == array.size

    array[index] *= 2

    index += 1
  end

  array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p my_numbers.object_id
p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
p my_numbers
p my_numbers.object_id
=end

# Question 3 - Method that doubles the numbers that have odd indices in an array

=begin
def double_odd_indices(array)
  index = 0
  output_array = []

  loop do
    break if index == array.size

    if index.odd?
      output_array << array[index] * 2
    else
      output_array << array[index]
    end

    index += 1
  end

  output_array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indices(my_numbers)  # => [1, 8, 3, 14, 2, 12]
p my_numbers
=end

# Question 4 - Method that multiplies every array item by a specified value

# Non-destructive implementation
=begin
def multiply(array, multiplier)
  array.map { |num| num * multiplier }
end
=end

# Destructive, long-winded implementation
=begin
def multiply(array, multiplier)
  index = 0

  loop do
    break if index == array.size

    array[index] *= multiplier

    index += 1
  end

  array
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
p my_numbers
=end
