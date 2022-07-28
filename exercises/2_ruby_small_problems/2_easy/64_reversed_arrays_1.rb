# Use a loop. Initiate an index.
# Swap the first index with the last index.
# Increment the index.
# Swap the second index with the second last index.
# Continue the loop until the index equals length / 2.

def reverse!(array)
  # Deal with edge cases
  return array if array.size < 2

  index = 0
  last_index = array.length - 1

  loop do
    array[index], array[last_index - index] =
      array[last_index - index], array[index]

    index += 1

    break if (array.length / 2) == index
  end

  array
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true
