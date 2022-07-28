print 'Please write word or multiple words: '

input = gets.chomp

# Split the string into an array of words.
# Initialise the accumulator value to 0.
# Iterate over the words. Take each of their word length, add it to sum.
# The final value of sum is the return value for the method.
num_characters = input.split.reduce(0) { |sum, word| sum + word.length }

print "There are #{num_characters} characters in \"#{input}\"."
