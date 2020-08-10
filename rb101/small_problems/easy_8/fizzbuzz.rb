def fizzbuzz(num1, num2)
  result = (num1..num2).to_a
  result.each do |num|
    if num % 3 == 0 && num % 5 != 0
      print "Fizz, "
    elsif num % 5 == 0 && num % 3 != 0
      print "Buzz, "
    elsif num % 3 == 0 && num % 5 == 0
      print "FizzBuzz, "
    else
      print "#{num}, "
    end
  end
end

# Doesn't work because adds comma at the end.
# Also, less convoluted to check 3 && 5, before each individual case.

def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end