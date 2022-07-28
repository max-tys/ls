def digit_list(positive_integer)
  array_of_strings = positive_integer.to_s.split(//)
  # array_of_strings.map { |_| _.to_i }
  array_of_strings.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
