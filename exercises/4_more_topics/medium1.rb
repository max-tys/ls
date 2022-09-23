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

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

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
