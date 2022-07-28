# Original solution
# You could have used the Array#reverse_each method.
=begin
def reverse(original_array)
  new_array = []
  return new_array if original_array.empty?

  left_index = 0
  right_index = -1

  loop do
    new_array[left_index] = original_array[right_index]
    left_index += 1
    right_index -= 1
    break if left_index == original_array.length
  end

  new_array
end
=end

# Further exploration with Enumerable#each_with_object
=begin
def reverse(original_array)
  original_array.each_with_object([]) do |element, new_array|
    new_array.unshift(element)
  end
end
=end

# Further exploration with inject
def reverse(original_array)
  original_array.inject([], :unshift)
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
