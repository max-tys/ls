# Write a method that takes a 3 x 3 matrix in Array of Arrays format
# and returns the transpose of the original matrix.

# Original solution
def transpose(matrix)
  new_matrix = [[], [], []]

  matrix.each do |row|
    column_index = matrix.index(row)
    row.each_with_index do |element, row_index|
      new_matrix[row_index][column_index] = element
    end
  end

  new_matrix
end

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Further exploration, building on suggested solution.
def transpose!(matrix)
  (0..2).each do |column_index|
    new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
    matrix << new_row
  end
  matrix.slice!(0, 3)
  nil
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

transpose!(matrix)

p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
