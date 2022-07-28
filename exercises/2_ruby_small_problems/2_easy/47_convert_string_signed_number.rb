NUMBERS = {
  '0' : 0, '1' : 1, '2' : 2, '3' : 3, '4' : 4,
  '5' : 5, '6' : 6, '7' : 7, '8' : 8, '9' : 9
}

def string_to_integer(string)
  int_array = string.chars.map { |char| NUMBERS[char] }

  output_integer = 0

  int_array.each { |int| output_integer = output_integer * 10 + int }

  output_integer
end

# Original solution

def string_to_signed_integer(string)
  if string.chr == '+'
    string.slice!(0)
    return string_to_integer(string)
  elsif string.chr == '-'
    string.slice!(0)
    return string_to_integer(string) * -1
  else
    return string_to_integer(string)
  end
end

# Further exploration - refactored standard solution

def string_to_signed_integer(string)
  # Convert string to int regardless of the sign.
  # Pass the clean string as an argument to the str-to-int method.
  # Convert the int to a negative int if necessary.
  result = string_to_integer(string.delete('^0-9'))
  string[0] == '-' ? -result : result
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
