def halvsies(og_array)
  mid_index = if og_array.size.odd?
                og_array.size / 2
              else
                og_array.size / 2 - 1
              end
  arr1 = og_array[0..mid_index]
  arr2 = og_array[(mid_index + 1)..-1]
  [arr1, arr2]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
