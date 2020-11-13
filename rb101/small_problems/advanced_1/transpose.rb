# Input is a 3 x 3 matrix

# example: 
# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

def transpose(matrix)
  new_matrix = []

  matrix.size.times do |idx|
    new_row = []
    matrix.each { |row| new_row << row[idx] }
    new_matrix << new_row
  end

  new_matrix
end


def transpose!(matrix)
  grid_size = matrix.size - 1

  (0..grid_size).each do |a|
    (a..grid_size).each do |b|
      matrix[a][b], matrix[b][a] = matrix[b][a], matrix[a][b]
    end
  end
end

# The method above with multiple variable reassignment does not work for non-square matrices

def transpose_any(matrix)
  result = []
  num_of_rows = matrix.size
  num_of_columns = matrix.first.size

  (0...num_of_columns).each do |column_index|
    new_row = (0...num_of_rows).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end