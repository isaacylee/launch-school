def oddities(arr)
  arr.select.with_index{ |element, idx| idx % 2 == 0}
end

oddities([2, 3, 4, 5, 6]) == [2, 4, 6] # => true
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5] # => true
oddities(['abc', 'def']) == ['abc'] # => true
oddities([123]) == [123] # => true
oddities([]) == [] # => true


# Further exploration

def oddities2(arr)
  filtered = []
  arr.each.with_index do |element, idx| 
    if idx % 2 == 0
      filtered << element
    end
  end
  filtered
  end

def evens(arr)
  even_elements = []
  index = 1
  while index < arr.size
    even_elements << arr[index]
    index += 2
  end
  even_elements
end
