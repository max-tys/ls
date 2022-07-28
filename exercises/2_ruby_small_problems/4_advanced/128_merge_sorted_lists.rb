# Write a method that takes two sorted Arrays as arguments,
# and returns a new Array that contains all elements from both arguments in sorted order.
# You may not provide any solution that requires you to sort the result array.
# You must build the result array one element at a time in the proper order.
# Your solution should not mutate the input arrays.

def merge(arr1, arr2)
  return arr1 if arr2.empty?
  return arr2 if arr1.empty?

  new_arr = []

  idx1 = 0
  idx2 = 0
  loop do
    if arr1[idx1] <= arr2[idx2]
      new_arr << arr1[idx1]
      idx1 += 1
      break if idx1 == arr1.size
    else
      new_arr << arr2[idx2]
      idx2 += 1
      break if idx2 == arr2.size
    end
  end

  if idx1 == arr1.size
    new_arr.concat(arr2[idx2..-1])
  elsif idx2 == arr2.size
    new_arr.concat(arr1[idx1..-1])
  end

  new_arr
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
p merge([4, 7, 9, 10], [0, 1, 3, 6, 7]) == [0, 1, 3, 4, 6, 7, 7, 9, 10]
