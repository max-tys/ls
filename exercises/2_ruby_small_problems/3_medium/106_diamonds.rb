# Write a method that displays a 4-pointed diamond in an n x n grid,
# where n is an odd integer that is supplied as an argument to the method.
# You may assume that the argument will always be an odd integer.

# Solution to original problem
def diamond(grid_size)
  # Create an array of number of diamonds in each row.
  diamonds = []
  1.upto(grid_size).each { |i| diamonds << i if i.odd? }
  diamonds += diamonds[0...-1].reverse

  # Generate diamond output
  diamonds.each do |num_diamond|
    num_space = (grid_size - num_diamond) / 2
    puts (' ' * num_space) + ('*' * num_diamond)
  end
end

diamond(13)

# Further exploration - hollow diamond

def print_row(row_num, grid_size)
  side_space = (((grid_size + 1) / 2) - row_num).abs
  middle_space = grid_size - 2 - (side_space * 2)

  if (row_num == 1) || (row_num == grid_size)
    puts (' ' * side_space) + '*'
  else
    puts (' ' * side_space) + '*' + (' ' * middle_space) + '*'
  end
end

def hollow_diamond(grid_size)
  1.upto(grid_size).each do |row_num|
    print_row(row_num, grid_size)
  end
end

hollow_diamond(13)
