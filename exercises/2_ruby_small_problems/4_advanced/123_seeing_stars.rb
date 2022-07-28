# Write a method that displays an 8-pointed star in an nxn grid,
# where n is an odd integer that is supplied as an argument to the method.
# The smallest such star you need to handle is a 7x7 grid.

def star(grid_size)
  three_stars = ['*', '*', '*']

  top_rows = (grid_size - 3) / 2
  top_rows.downto(0) do |i|
    spaces = ' ' * i
    puts three_stars.join(spaces).center(grid_size)
  end

  puts '*' * grid_size

  bottom_rows = top_rows
  0.upto(bottom_rows) do |i|
    spaces = ' ' * i
    puts three_stars.join(spaces).center(grid_size)
  end
end

star(11)
