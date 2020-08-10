def reverse(arr)
  reversed_array = []

  loop do
    reversed_array << arr.pop
    break if arr.size == 0
  end

  reversed_array
end


# This solution yields the desired outcome
# Technically, does not fit the criteria, as it does not mutate the array

def reverse_mutate(arr)
  first_index = 0
  last_index = -1

  while first_index < arr.size / 2
    arr[first_index], arr[last_index] = arr[last_index], arr[first_index]
    first_index += 1
    last_index -= 1
  end

  arr
end