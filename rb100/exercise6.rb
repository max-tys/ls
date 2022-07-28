# Arrays

# Question 1
=begin
arr = [1, 3, 5, 7, 9, 11]
number = 3
if arr.include? number
  puts "Your number, #{number}, appears in the array."
else
  puts "Your number, #{number}, does not appear in the array."
end
=end

# Question 2
=begin
1. arr = ["b", "a"]
   arr = arr.product(Array(1..3))
   # arr = [["b", 1], ["b", 2], ["b", 3], ... ["a", 3]]
   arr.first.delete(arr.first.last)
   # arr.first returns ["b", 1]
   # arr.first.last returns 1
   # ["b", 1].delete(1) returns 1
   # arr is now [["b"], ["b", 2], ["b", 3], ... ["a", 3]]

2. arr = ["b", "a"]
   arr = arr.product([Array(1..3)]) # nested array
   # arr = [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
   arr.first.delete(arr.first.last)
   # arr.first --> ["b", [1, 2, 3]]
   # arr.first.last --> [1, 2, 3]
   # ["b", [1, 2, 3]].delete([1, 2, 3]) returns [1, 2, 3]
   # arr is now [["b"], ["a", [1, 2, 3]]]
=end

# Question 3
=begin
arr = [["test", "hello", "world"],["example", "mem"]]
puts arr.last.first # returns the word "example"
=end

# Question 4
=begin
arr = [15, 7, 18, 5, 12, 8, 5, 1]

arr.index(5) # returns 3

arr.index[5] # produces an error

arr[5] # returns 8
=end

# Question 5
=begin
string = "Welcome to America!"
a = string[6] #"e"
b = string[11] #"A"
c = string[19] #nil
=end

# Question 6

# We cannot type in 'margaret' in place of an index number.

# Question 7

=begin
array = ["Courses", "Forum", "Events", "Sharing", "Videos"]
array.each_with_index { |value, index| puts "#{index}: #{value}" }
=end

# Question 8

og_array = [1, 2, 3, 4, 5]
new_array = []
og_array.each do |num|
  new_array << num + 2
end
p og_array, new_array