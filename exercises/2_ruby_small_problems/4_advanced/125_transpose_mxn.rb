def transpose(matrix)
  new_matrix = []

  # If old matrix has 3 sub-arrays, i.e. 3 rows, new matrix has 3 columns.
  new_column_size = matrix.size

  # If each sub-array of the old matrix has 5 elements, new matrix has 5 cols.
  new_row_size = matrix[0].size

  # Populate the new matrix row by row, sub-array by sub-array.
  # The row index of the new matrix is the column index of the old matrix.
  # The column index of the new matrix is the row index of the old matrix.
  # matrix[row][column] = new_matrix[column][row]
  (0...new_row_size).each do |new_row_index|
    new_row = (0...new_column_size).map do |new_column_index|
      matrix[new_column_index][new_row_index]
    end
    new_matrix << new_row
  end

  # Return the new matrix.
  new_matrix
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
