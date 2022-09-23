# 1 Listening Device

# class Device
#   def initialize
#     @recordings = []
#   end

#   def record(recording)
#     @recordings << recording
#   end

#   def listen
#     record(yield) if block_given?
#   end

#   def play
#     puts @recordings.last
#   end
# end

# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# listener.play # Outputs "Hello World!"

# 2 Text Analyzer - Sandwich Code

# class TextAnalyzer
#   def process
#     f = File.open('sample_text.txt')
#     yield(f.read)
#     f.close
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
# analyzer.process { |text| puts "#{text.split("\n").count} lines" }
# analyzer.process { |text| puts "#{text.split.count} words" }

# 3 Passing Parameters Part 1

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "Nice selection of food we have gathered!"
# end

# gather(items) { |items| puts items.join(', ') }

# 4 Passing Parameters Part 2

# birds = %w(raven finch hawk eagle)

# def splat(array)
#   yield(array)
# end

# splat(birds) do |_, _, *raptors|
#   p raptors
# end

# 5 Passing Parameters Part 3

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end

# gather(items) do |*first_three, rest|
#   puts first_three.join(", ")
#   puts rest
# end

# gather(items) do |first, *middle_two, rest|
#   puts first
#   puts middle_two.join(", ")
#   puts rest
# end

# gather(items) do |first, *rest|
#   puts first
#   puts rest.join(", ")
# end

# gather(items) do |one, two, three, four|
#   puts "#{one}, #{two}, #{three}, and #{four}"
# end

# 6 Method to Proc

# # Replace the two `method_name` placeholders with actual method calls
# def convert_to_base_8(n)
#   n.to_s(8).to_i
# end

# # Replace `argument` with the correct argument below
# # `method` is `Object#method`, not a placeholder
# base8_proc = method(:convert_to_base_8).to_proc

# # We'll need a Proc object to make this code work
# # Replace `a_proc` with the correct object
# p [8, 10, 12, 14, 16, 33].map(&base8_proc) # [10, 12, 14, 16, 20, 41]

# 7 Bubble Sort with Blocks (Original)

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       sorted = if block_given?
#                 yield(array[index - 1], array[index])
#               else
#                 array[index - 1] <= array[index]
#               end

#       # Check the next pair if the current pair is sorted
#       next if sorted

#       # If the current pair is not sorted, swap them around
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     # Break if no swaps were made, i.e. the array is completely sorted
#     # Continue checking the entire array if any swaps were made on this round
#     break unless swapped
#   end
#   nil
# end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# p array == [7, 5, 3]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = [6, 12, 27, 22, 14]
# bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
# p array == [14, 22, 12, 6, 27]

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# p array == %w(Kim Pete Tyler alice bonnie rachel sue)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)

# 7 Bubble Sort with Blocks (Further Exploration)

def bubble_sort!(array)
  loop do
    swapped = false

    1.upto(array.size - 1) do |index|
      if block_given?
        # Make a new array that holds the items for the basis of transformation
        # We only need to yield each item once
        transformed_array = array.map { |item| yield(item) }

        # Compare the elements of the new transformed array
        next if transformed_array[index - 1] <= transformed_array[index]
      else
        next if array[index - 1] <= array[index]
      end

      # Sort the elements of the input array
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end
    break unless swapped
  end
  nil
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)