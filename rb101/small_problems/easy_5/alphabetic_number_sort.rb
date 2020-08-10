NUMBERS = %w(zero one two three four 
             five six seven eight nine 
             ten eleven twelve thirteen fourteen
             fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(arr)
  number_strings = arr.map{ |number| NUMBERS[number] }
  number_strings.sort!
  number_strings.map{ |number| NUMBERS.index(number) }
end