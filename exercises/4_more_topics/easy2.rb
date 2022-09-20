# 1 From-To-Step Sequence Generator

# def step(start_val, end_val, step_val)
#   block_arg = start_val

#   while block_arg <= end_val
#     yield(block_arg)
#     block_arg += step_val
#   end
# end

# p step(1, 10, 3) { |value| puts "value = #{value}" }

# 2 Zipper

# def zip(arr1, arr2)
#   output = []

#   (0...arr1.size).each do |idx|
#     output << [arr1[idx], arr2[idx]]
#   end

#   output
# end

# p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# 3 map

# def map(array)
#   array.each_with_object([]) { |item, new_array| new_array << yield(item) }
# end

# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# 4 count

# def count(*args)
#   total = 0
#   args.each { |item| total += 1 if yield(item) }
#   total
# end

# p count(1, 3, 6) { |value| value.odd? } == 2
# p count(1, 3, 6) { |value| value.even? } == 1
# p count(1, 3, 6) { |value| value > 6 } == 0
# p count(1, 3, 6) { |value| true } == 3
# p count() { |value| true } == 0
# p count(1, 3, 6) { |value| value - 6 } == 3

# 5 drop_while

# def drop_while(input_array)
#   first_falsey_idx = nil

#   input_array.each_with_index do |item, idx|
#     unless yield(item) # if the block is falsey
#       first_falsey_idx = idx
#       break
#     end
#   end

#   first_falsey_idx.nil? ? [] : input_array[first_falsey_idx..-1]
# end

# p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true } == []
# p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# p drop_while([]) { |value| true } == []

# 6 each_with_index

# def each_with_index(array)
#   array.each do |item|
#     idx = array.index(item)
#     yield(item, idx)
#   end
# end

# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]

# 7 each_with_object

# def each_with_object(arr, obj)
#   arr.each { |item| yield(item, obj) }
#   obj
# end

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# p result == [1, 9, 25]

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# p result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# p result == {}

# 8 max_by

# def max_by(array)
#   return nil if array.empty?

#   largest_item = array.first
#   largest_value = yield(largest_item)

#   array[1..-1].each do |item|
#     current_value = yield(item)
#     if current_value > largest_value
#       largest_value = current_value
#       largest_item = item
#     end
#   end

#   largest_item
# end

# p max_by([1, 5, 3]) { |value| value + 2 } == 5
# p max_by([1, 5, 3]) { |value| 9 - value } == 1
# p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# p max_by([-7]) { |value| value * 3 } == -7
# p max_by([]) { |value| value + 5 } == nil

# 9 each_cons (Part 1)

# def each_cons(array)
#   idx = 0

#   while idx < array.size - 1
#     yield(array[idx], array[idx + 1])
#     idx += 1
#   end

#   nil
# end

# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == { 1 => 3, 3 => 6, 6 => 10 }
# p result == nil

# hash = {}
# result = each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {}
# p result == nil

# hash = {}
# result = each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {'a' => 'b'}
# p result == nil

# 10 each_cons (Part 2)

# def each_cons(array, num_elements)
#   array.each_index do |idx|
#     break if idx > array.size - num_elements
#     yield(*array[idx..(idx + num_elements - 1)])
#   end
#   nil
# end

# hash = {}
# each_cons([1, 3, 6, 10], 1) do |value|
#   hash[value] = true
# end
# p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

# hash = {}
# each_cons([1, 3, 6, 10], 2) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# each_cons([1, 3, 6, 10], 3) do |value1, *values|
#   hash[value1] = values
# end
# p hash == { 1 => [3, 6], 3 => [6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 4) do |value1, *values|
#   hash[value1] = values
# end
# p hash == { 1 => [3, 6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 5) do |value1, *values|
#   hash[value1] = values
# end
# p hash == {}