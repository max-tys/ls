# Original solution

=begin
def oddities(array)
  new_array = []
  array.each { |element| new_array << element if array.index(element).even? }
  new_array
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
=end

# Alternative solution 1
=begin
def oddities(array)
  index = 0
  new_array = []
  while index < array.length
    new_array << array[index]
    index += 2
  end
  new_array
end

puts oddities([2, 3, 4, 5, 6, 7])
=end

# Alternative solution 2

def oddities(array)
  array.select! { |element| array.index(element).even? }
end

puts oddities([2, 3, 4, 5, 6, 7])
