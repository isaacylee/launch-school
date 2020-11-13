require 'pry'
require 'pry-byebug'

def rotate_ccw(matrix)
  result = []
  num_of_rows = matrix.size - 1
  num_of_columns = matrix.first.size - 1

  num_of_columns.downto(0) do |column_index|
    new_row = (0..num_of_rows).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end

def rotate_cw(matrix)
  result = []
  num_of_rows = matrix.size
  num_of_columns = matrix.first.size

  (0...num_of_columns).each do |column_index|
    new_row = []
    (num_of_rows - 1).downto(0) do |row_index|
      new_row << matrix[row_index][column_index]
    end
    result << new_row
  end
  result
end

def rotate_cw_fe(matrix, degrees)
  rotations = nil

  case degrees
  when 90 then rotations = 1
  when 180 then rotations = 2
  when 270 then rotations = 3
  when 360 then rotations = 0
  else return 'Error! Invalid angle.'
  end

  rotations.times do 
    matrix = rotate_cw(matrix)
  end
  
  matrix
end

