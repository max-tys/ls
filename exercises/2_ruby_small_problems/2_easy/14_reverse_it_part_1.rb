def reverse_sentence(string)
  reverse_string_array = string.split.reverse
  reverse_string_array.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == ''

# No need to do anything spcial to handle the two edge cases.
# Both '' and '  ' causes split to return an empty array.
