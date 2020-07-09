def stringy(num)
  output = []
  counter = num
  loop do
    output << 1
    counter -= 1
    break if counter == 0
    output << 0
    counter -= 1
    break if counter == 0
  end
  output.join
end

puts stringy(9)  == '101010101'
puts stringy(4)  == '1010'
puts stringy(6)  == '101010'
puts stringy(7)  == '1010101'

# Further exploration

def stringy(num, start = 1)
  output = []
  counter = num
  if start == 1
    loop do
      output << 1
      counter -= 1
      break if counter == 0
      output << 0
      counter -= 1
      break if counter == 0
    end
  else
    loop do
      output << 0
      counter -= 1
      break if counter == 0
      output << 1
      counter -= 1
      break if counter == 0
    end
  end
  output.join
end

puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'