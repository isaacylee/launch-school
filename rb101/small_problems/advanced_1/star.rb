# Display an 8-pointed star in a n x n grid
# n is an ODD INTEGER > 7

# def star(n)
#   empty_outer = 0
#   empty_inner = (n - 3)/2

#   until empty_inner < 0
#     new_line = ''

#     empty_outer.times { new_line << ' ' }
#     new_line << '*'
#     empty_inner.times { new_line << ' ' }
#     new_line << '*'
#     empty_inner.times { new_line << ' ' }
#     new_line << '*'
#     empty_outer.times { new_line << ' ' }

#     empty_outer += 1
#     empty_inner -= 1

#     puts new_line
#   end

#   puts "*" * n

#   empty_outer = (n - 3)/2
#   empty_inner = 0

#   until empty_outer < 0
#     new_line = ''

#     empty_outer.times { new_line << ' ' }
#     new_line << '*'
#     empty_inner.times { new_line << ' ' }
#     new_line << '*'
#     empty_inner.times { new_line << ' ' }
#     new_line << '*'
#     empty_outer.times { new_line << ' ' }

#     empty_outer -= 1
#     empty_inner += 1

#     puts new_line
#   end

# end

# This works, but it clearly needs to be refactored.

# Refactored version

def print_row(grid_size, distance_from_center)
  number_of_spaces = distance_from_center - 1
  spaces = ' ' * number_of_spaces

  output = (['*'] * 3).join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2

  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }
end


