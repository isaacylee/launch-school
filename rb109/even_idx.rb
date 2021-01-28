# Given an array of integers, find an index N where the sum of the integers to the left of the N is equal to the sum of the integers to the right of N. If there is no possible index, return -1.

# Iterate through index 0 to arr.length.
# Assign left and right sides of array to variables and take their sums.
# Compare the sums.
require 'pry'
require 'pry-byebug'

def find_even_index(arr)
  (0...arr.size).each do |index|
    if left_of_idx_sum(arr, index) == right_of_idx_sum(arr,index)
      return index
    end
  end
  -1
end

def left_of_idx_sum(arr, idx)
  arr1 = arr.clone
  left = []
  idx.times { left << arr1.shift }
  left.sum
end

def right_of_idx_sum(arr, idx)
  arr1 = arr.clone
  right = []
  (arr.size - (idx + 1)).times { right << arr1.pop }
  right.sum
end



p find_even_index([1, 2, 3, 4 , 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3


