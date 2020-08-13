def rotate_array(arr)
  arr << arr.shift
end

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(integer)
  rotate_array(integer.to_s.chars).join.to_i
end

def rotate_rightmost_digits(integer, n)
  str = integer.to_s
  str1 = str.slice(0, str.size-n)
  str2 = str.slice(str.size-n, n)
  (str1 + rotate_string(str2)).to_i
end

def maximum_rotation(integer)
  rotate_number_of_values = integer.to_s.size
  while rotate_number_of_values > 0
    integer = rotate_rightmost_digits(integer, rotate_number_of_values)
    rotate_number_of_values -= 1
  end
  integer
end