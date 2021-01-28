require 'pry'
require 'pry-byebug'

def bubble_sort(arr)
  loop do
    a = 0
    b = 1
    swapped = false
    until b > arr.size - 1
      if arr[a] > arr[b]
        arr[a], arr[b] = arr[b], arr[a]
        swapped = true
      end
      a += 1
      b += 1
    end
    break if swapped == false
  end

  arr
end

p bubble_sort([6, 2, 1, 7, 1, 4])