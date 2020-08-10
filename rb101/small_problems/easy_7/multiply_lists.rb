def multiply_list(arr1, arr2)
  arr1.zip(arr2).map{|_| _.inject(1, :*)}
end