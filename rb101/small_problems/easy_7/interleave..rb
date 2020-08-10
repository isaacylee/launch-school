def interleave (arr1, arr2)
  result = []
  until arr2.empty?
    result << arr1.shift
    result << arr2.shift
  end
  result
end

def interleave_with_zip(arr1, arr2)
  arr1.zip(arr2).flatten
end