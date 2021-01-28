# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

def rotate_array(arr)
  arr = arr.clone
  arr << arr.shift
  arr
end

# Write a method that can rotate the last n digits of a number. 

# Algorithm
# Convert input number into an array of its digits
# Seperate unchanged portion of number and the last n digits as separate arrays.
# Use rotate method on last n digits portion.
# Join the separate parts after rotation is performed.

def rotate_rightmost_digits(num, n)
  digits = num.digits.reverse
  last_n_digits = []
  n.times { last_n_digits.unshift(digits.pop) }
  last_n_digits = rotate_array(last_n_digits)
  digits.concat(last_n_digits).join.to_i
end

def max_rotation(num)
  num.digits.size.downto(1) do |n|
    num = rotate_rightmost_digits(num, n)
  end
  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845