def halvies(arr)
  return [] if arr == []
  return [arr, []] if arr.size == 1

  arr_half = arr.size / 2

  second_half = []

  loop do
    second_half.unshift(arr.pop)
    break if second_half.size == arr_half
  end

  [arr, second_half]
end

# This solution works only if you get an array of size two or more
# Requires exceptions for an array with one element and an empty array

def halvies_by_slice(arr)
  middle = (arr.size / 2.0).ceil

  first_half = arr.slice(0, middle)
  second_half = arr.slice(middle, arr.size - middle)

  [first_half, second_half]
end