# Write a method that takes an Array as an argument,
# and sorts that Array using the bubble sort algorithm as just described.
# Note that your sort will be "in-place";
# that is, you will mutate the Array passed as an argument.
# You may assume that the Array contains at least 2 elements.

require 'pry'

def bubble_sort!(arr)
  loop do
    sorted = false
    last_index = arr.size - 2 # We start with the 2nd last index.

    0.upto(last_index) do |i|
      if arr[i] > arr[i + 1] # if left element is greater than right element
        arr[i], arr[i + 1] = arr[i + 1], arr[i] # swap them
        sorted = true # indicates that something had been sorted
      end
    end

    last_index -= 1 # No need to sort the last element (rabbit).
    break if sorted == false || last_index < 0
  end

  nil
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
