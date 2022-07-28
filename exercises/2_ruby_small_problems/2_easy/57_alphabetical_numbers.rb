ENGLISH_NUMBERS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

# Original solution
=begin
def alphabetic_number_sort(array)
  # Create a nested array of alphabetical numbers and integer pairs.
  # [["zero", 0], ["one", 1], ... ["nineteen", 19]]
  nested_array = []

  ENGLISH_NUMBERS.each_with_index do |num, i|
    nested_array << [num, array[i]]
  end

  # Sort the keys-value pairs alphabetically.
  # ==> [["eight", 8], ["eighteen", 18], ... ["zero", 0]]
  # Convert the nested array into a hash.
  # ==> {"eight"=>8, "eighteen"=>18, ... "zero"=>0}
  sorted_number_hash = nested_array.sort.to_h

  # Get the value from sorted_number_hash in sequence.
  # Store them in an array called sorted_array.
  sorted_array = []

  sorted_number_hash.each_value { |value| sorted_array << value }

  sorted_array
end
=end

# Given solution

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| ENGLISH_NUMBERS[number] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
