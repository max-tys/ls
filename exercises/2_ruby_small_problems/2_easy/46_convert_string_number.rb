# Solution for original problem

=begin
INTEGERS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

def string_to_integer(string)
  digit_array = string.chars.map { |char| INTEGERS[char.ord - 48] }
  # [1, 2, 3, 4]

  digit_array.reverse! # [4, 3, 2, 1]

  output_integer = 0

  index = 0
  while index < digit_array.size
    output_integer += digit_array[index] * 10**index
    index += 1
  end

  output_integer
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
=end

# Solution for further exploration

HEX_INT = {
  '0' : 0, '1' : 1, '2' : 2, '3': 3, '4': 4,
  '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
  'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
}

def hexadecimal_to_integer(hex)
  int_array = hex.upcase.chars.map { |char| HEX_INT[char] }

  output_integer = 0

  int_array.each { |int| output_integer = output_integer * 16 + int }

  output_integer
end

p hexadecimal_to_integer('4D9f') == 19871
