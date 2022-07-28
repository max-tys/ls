# Sort an array of passed in values using merge sort.
# You can assume that this array may contain only one type of data.
# And that data may be either all numbers or all strings.

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

def merge_sort(arr)
  # Baseline condition
  return arr if arr.size == 1

  # Split the array into equal halves.
  midpoint = arr.size / 2
  arr1 = arr[0...midpoint]
  arr2 = arr[midpoint..-1]

  # Recursive call to merge_sort
  arr1 = merge_sort(arr1)
  arr2 = merge_sort(arr2)

  # Combine the arrays.
  merge(arr1, arr2)
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
