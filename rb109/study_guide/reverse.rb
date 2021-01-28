# Write a method that reverses the elements in an array without using the reverse method.

# Algorithm
# Iterate through the first half of an array
#  Iterate through the last half of the array
#    Use double reassignment to swap elements at each index.

def reverse(arr)
  halfway = arr.length / 2
  left_idx = 0
  right_idx = -1

  loop do
    arr[left_idx], arr[right_idx] = arr[right_idx], arr[left_idx]
    left_idx += 1
    right_idx -= 1
    break if left_idx == halfway
  end

  arr
end

p reverse([0, 1, 2, 3, 4, 5])
p reverse(['a', 'b', 'c', 'd'])
