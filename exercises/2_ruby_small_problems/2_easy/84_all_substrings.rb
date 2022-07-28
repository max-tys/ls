# Write a method that returns a list of all substrings of a string.
# The returned list should be ordered by where in the string the substring begins.
# This means that all substrings that start at position 0 should come first,
# then all substrings that start at position 1, and so on.
# Since multiple substrings will occur at each position,
# the substrings at a given position should be returned in order from shortest to longest.

def leading_substrings(string)
  string.chars.each_index.with_object([]) { |index, array| array << string[0..index] }
end

def substrings(string)
  all_substrings = []

  index = 0
  loop do
    all_substrings << leading_substrings(string[index..-1])
    index += 1
    break if index >= string.size
  end

  all_substrings.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
