# Launch School solution

require 'pry'
require 'pry-byebug'

def rotate90(matrix)
  result = []
  (0..2).each do |column_index|
    new_row = (0..2).map do |row_index|
      matrix[row_index][column_index]
    end
    result << new_row.reverse
  end
  result
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

binding.pry

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))