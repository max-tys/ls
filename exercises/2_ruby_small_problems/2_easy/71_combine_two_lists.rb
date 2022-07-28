# Original solution
=begin
def interleave(arr1, arr2)
  output_array = []
  until arr2.empty?
    output_array << arr1.shift
    output_array << arr2.shift
  end
  output_array
end
=end

# Further exploration with Array#zip and Array#flatten.

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c'])
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
