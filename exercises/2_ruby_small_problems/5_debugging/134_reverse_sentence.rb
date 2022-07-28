# The reverse_sentence method should return a new string
# with the words of its argument in reverse order,
# without using any of Ruby's built-in reverse methods.
# However, the code below raises an error.
# Change it so that it behaves as expected.

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    # reversed_words = words[i] + reversed_words
    reversed_words.prepend(words[i])
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

# The code raises a TypeError because we attempted to pass an array object
# as an argument to the `String#+` method that is being called on line 13.
# The `String#+` method is used for concatenating two strings only.
# `words[i] + reversed_words` is syntactic sugar for `words[i].+(reversed_words)`
# We cannot invoke `String#+` with an array as an argument.
# To fix the code, we can replace line 13 with `reversed_words.prepend(words[i])`.
