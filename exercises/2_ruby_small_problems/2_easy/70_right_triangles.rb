# Original solution
=begin

def triangle(length)
  index = 0
  loop do
    length.times { print ' '}
    index.times { print '*' }
    print "\n"
    length -= 1
    index += 1
    break if length < 0
  end
end
=end

# Further exploration - print triangle at any corner
def triangle(length, corner)

  case corner
    when 1 # top-left
      stars = length
      spaces = 0
      while stars > 0 do
        puts ('*' * stars) + (' ' * spaces)
        stars -= 1
        spaces += 1
      end
    when 2 # top-right
      stars = length
      spaces = 0
      while stars > 0 do
        puts (' ' * spaces) + ('*' * stars)
        stars -= 1
        spaces += 1
      end
    when 3 # bottom-left
      stars = 1
      spaces = length
      while spaces > 0 do
        puts ('*' * stars) + (' ' * spaces)
        stars += 1
        spaces -= 1
      end
    when 4 # bottom-right
      stars = 1
      spaces = length
      while spaces > 0 do
        puts (' ' * spaces) + ('*' * stars)
        stars += 1
        spaces -= 1
      end
  end
end

triangle(5, 1)
triangle(5, 2)
triangle(5, 3)
triangle(5, 4)
