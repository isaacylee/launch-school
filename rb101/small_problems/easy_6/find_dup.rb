def find_dup(arr)
  ordered_arr = arr.sort
  unique_values = []
  loop do
    break if unique_values.include?(ordered_arr.last)
    unique_values << ordered_arr.pop 
  end

  ordered_arr.last
end

