def average(arr)
  arr.reduce(0.0, :+)/arr.size
end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])