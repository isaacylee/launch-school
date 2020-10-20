def bubble_sort!(arr)
  loop do
    swapped = false
    i = 0
    while i <= arr.length-2
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
      i += 1
    end

    break if swapped == false
  end
  nil
end
