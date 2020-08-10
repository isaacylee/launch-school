numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)
# [1, 3, 4, 5]       Deletes value at index of 1
# => 2               Returns the deleted value

numbers.delete(1)
# [2, 3, 4, 5]       Deletes value of 1
# => 1               Returns the deleted value

# Both these methods are destructive and operator directly on the array