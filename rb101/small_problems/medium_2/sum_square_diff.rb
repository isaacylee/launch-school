def sum_square_difference(num)
  sum = 0
  square_sum = 0

  1.upto(num) do |i|
    sum += i
    square_sum += i ** 2
  end

  sum_square = sum ** 2
  sum_square - square_sum
end


  