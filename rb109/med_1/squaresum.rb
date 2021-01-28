# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

# Algorithm
# create an array of the first n positive integers.
# Get the sum of the array and square it for the sum square
# Transform the array to its squares and get its sum for the square sum.
# Evaluate the difference.

def sum_square_difference(n)
  first_n_integers = (1..n).to_a

  sum_square = first_n_integers.sum ** 2

  square_sum = first_n_integers.map { |n| n ** 2 }.sum

  sum_square - square_sum
end

p sum_square_difference(3) #== 22
    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) #== 2640
p sum_square_difference(1) #== 0
p sum_square_difference(100) #== 25164150