# You have a bank of switches before you, numbered from 1 to n.
# Each switch is connected to exactly one light that is initially off.
# You walk down the row of switches and toggle every one of them.
# Go back to the beginning. On this second pass, toggle switches 2, 4, 6 ...
# Go back to the beginning. On this third pass, toggle switches 3, 6, 9 ...
# Repeat this process until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches,
# and returns an Array that identifies which lights are on after n repetitions.

# Generate an array of multiples of num up to the limit.
def multiples(num, limit)
  output = []

  index = 1
  loop do
    (num * index) <= limit ? output << (num * index) : break
    index += 1
  end

  output
end

# Helper method for further exploration.
# Converts an array of integers into human-readable text.
def text_output(array)
  case
  when array.size == 1
    array[0]
  when array.size == 2
    "#{array[0]} and #{array[1]}"
  else
    array.each_with_object('') do |i, output|
      i == array.last ? output << "and #{i}" : output << "#{i}, "
    end
  end
end

# Main method
def display_lights(num)
  # Array of bools representing the switches 1 up to num. Round 1 is built in.
  switches = [true] * num

  # Turn the switches on and off according to the requirements.
  2.upto(num) do |i|
    multiples(i, num).each { |j| switches[j - 1] = !switches[j - 1] }
  end

  # Convert the array of booleans into an array of integers.
  # The integers in the array represent the indexes of the activated switches.
  # The index starts counting from 1 up to num.
  on_switches = switches.map.with_index { |switch, i| (i + 1) if switch == true }.compact
  off_switches = (1..num).to_a - on_switches

  puts "Lights #{text_output(off_switches)} are now off; "\
       "lights #{text_output(on_switches)} are on."
end

display_lights(5)
display_lights(10)
display_lights(15)

# p display_lights(5) == [1, 4]
# p display_lights(10) == [1, 4, 9]
# p display_lights(1000)
