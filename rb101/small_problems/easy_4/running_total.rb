def running_total(arr)
  return [] if arr == []
  total = []
  total << arr[0]
  1.upto(arr.size - 1) do |n|
    total[n] = arr[n] + total[n - 1]
  end
  total
end

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []



# Much simpler solution below:

# def running_total(array)
#   sum = 0
#   array.map { |value| sum += value }
# end


def running_total(arr)
  sum = 0
  arr.map { |num| sum += num }
end