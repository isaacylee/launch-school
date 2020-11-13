def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

def merge_sort(array)
  if array.size < 2
    return array
  else
    array_left = array[0...array.size / 2]
    array_right = array[array.size / 2..-1]
  end
  
  array_left = merge_sort(array_left)
  array_right = merge_sort(array_right)

  merge(array_left, array_right)
end