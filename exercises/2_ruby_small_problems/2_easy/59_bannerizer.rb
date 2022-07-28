# Standard problem
=begin
def print_in_box(string)
  inside_length = string.length + 2
  horizontal_line = "+#{'-' * inside_length}+"
  empty_line = "|#{' ' * inside_length}|"

  puts horizontal_line
  puts empty_line
  puts "| " + string + " |"
  puts empty_line
  puts horizontal_line
end

# Further exploration 1 - truncate message

def print_in_box(string)
  inside_length = string.slice(0..75).length + 2 # Max length of 76 + 2 = 78
  horizontal_line = "+#{'-' * inside_length}+"
  empty_line = "|#{' ' * inside_length}|"

  puts horizontal_line
  puts empty_line
  puts "| " + string.slice(0..75) + " |"
  puts empty_line
  puts horizontal_line
end
=end

# Further exploration 2 - word wrapping

def word_wrap(string)
  lines = []
  while !string.empty?
    lines << string.slice!(0..75)
  end
  lines
end

def print_in_box(message)
  wrapped_message = word_wrap(message)
  inside_length = if wrapped_message.empty?
                    2
                  else
                    wrapped_message[0].slice(0..75).length + 2 # Max length 78
                  end
  horizontal_line = "+#{'-' * inside_length}+"
  empty_line = "|#{' ' * inside_length}|"

  puts horizontal_line
  puts empty_line

  if wrapped_message.empty?
    puts "|  |"
  else
    wrapped_message.each { |message| puts "| #{message.ljust(inside_length - 2)} |" }
  end

  puts empty_line
  puts horizontal_line
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('We want to invite you to contribute your unique solution or analysis. The goal here is to showcase the variety of ways in which this exercise can be solved, and the various tradeoffs one has to consider when working to a solution.')
