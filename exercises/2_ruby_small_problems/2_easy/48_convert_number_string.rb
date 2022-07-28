INT_STR = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def integer_to_string(integer)
  array = []
  loop do
    # Take the last digit of the string-integer and put it at 0 index of array.
    array.prepend(integer % 10)
    integer /= 10
    break if integer == 0
  end
  array.map! { |i| INT_STR[i] }
  array.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
