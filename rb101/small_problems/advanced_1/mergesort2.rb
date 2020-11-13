# non-recursive merge sort method

require 'pry'
require 'pry-byebug'

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


def merge_sort_nr(arr)
  original_size = arr.size
  divided_array = arr.map { |x| [x] }
  
  until divided_array.size == 2
    output_arr = []
    i = 0
    while i <= divided_array.size - 2
      output_arr << merge(divided_array[i], divided_array[i + 1])
      i += 2
    end
    output_arr << divided_array[-1] if divided_array.size.odd?

    divided_array = output_arr
  end

  merge(divided_array[0], divided_array[1])
end

arr = [4, 52, 34, 12]
arr2 = [6, 232, 11, 45, 39, 18, 58]

p merge_sort_nr(arr)
p merge_sort_nr(arr2)