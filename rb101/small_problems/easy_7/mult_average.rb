def show_multiplicative_average(arr)
  result = arr.inject(1.0, :*) / arr.size
  puts "The result is %0.3f" % result
end
