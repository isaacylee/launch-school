# Find the max sum of a contiguous subsequence in an array of integers.

# Input : Array of integers
# Output: Integer (largest sum of a subarray OR 0)

# Algorithm
# Return zero if all numbers are negative.
# Create an array of all subarrays
#  Initialize empty subarray array.
#  Iterate from 0 to the size of the array (this will be the starting index of the subarray)
#    Iterate from 1 to size of the array minus the starting index (this will be the length)
#      Access subarray using starting index and length and append to subarray array
# Transform all subarrays into their sums
# Sort the array of sums
# The last value will be the largest sum.

def max_sequence(arr)
  return 0 if arr.all? { |num| num.negative? }

  subarrays = all_subarrays(arr)
  subarrays.map { |subarray| subarray.sum }.sort.last
end

def all_subarrays(arr)
  subarrays = []
  (0...arr.size).each do |starting_idx|
    (1..(arr.size - starting_idx)).each do |length|
      subarrays << arr[starting_idx, length]
    end
  end
  subarrays
end

p max_sequence([])
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4])
p max_sequence([11])
p max_sequence([-32])
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4])