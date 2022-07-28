def swap_letters(string)
  buffer = string[0]
  string[0] = string[-1]
  string[-1] = buffer
  string
  # or string[0], string[-1] = string[-1], string[0]
end

def swap(string)
  output = string.split.map { |word| swap_letters(word) }
  output.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Further exploration
# You should not pass word[0] and word[1] as arguments to swap_letters.
# This will cause swap_letters to switch the positions of the words, not the char.
