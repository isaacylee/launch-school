def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map{|arr| arr.inject(1, :*)}.sort
end