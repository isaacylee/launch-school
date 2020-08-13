def sequence(num1, num2)
  start = num2
  result = []
  num1.times do |i|
    result << num2 + (num2 * i)
  end
  result
end