# Original solution

=begin
Initialise an empty new output array.
Add the first element of the input array to the output array.
Add the second element of the input array to the first element of the output array.
Add the third element of the input array to the second element of the output array.
Continue doing this until all elements of the input array are exhausted.
Return the output array.

def running_total(array)
  new_array = []

  return new_array if array.size == 0

  new_array << array[0]

  index = 0
  while index < (array.size - 1) do
    new_array << array[index +  1] + new_array[index]
    index += 1
  end

  new_array
end
=end

# Second (given) solution with Array#map
=begin
def running_total(array)
  sum = 0
  array.map { |num| sum += num }
end
=end

# Third solution using Enumerable#inject for further exploration
=begin
def running_total(array)
  new_array = []
  array.inject(0) do |sum, number|
    new_array[array.index(number)] = sum + number
  end
  new_array
end
=end

# Fourth solution with Enumerable#each_with_object for further exploration
def running_total(array)
  array.each_with_object([]) do |number, new_array|
    if new_array.empty?
      new_array << number
    else
      new_array << number + new_array.last
    end
  end
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
