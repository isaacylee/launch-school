def sum_of_sums(arr)
  sums = []
  arr.each_index{|idx| sums << arr[0..idx]}
  sums = sums.map{|sum| sum.reduce(0, :+)}
  sums.reduce(0, :+)
end
