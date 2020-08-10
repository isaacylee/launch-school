DIGITS = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4,
  "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9
}

def string_to_integer(str)
  digits = str.chars
  digits = digits.map { |digit| digit = DIGITS[digit] }

  value = 0
  digits.each { |digit| value = 10 * value + digit}
  value
end

string_to_integer("1234") 

# string => array
# Use hash to replace string value with integer value in array
# Combine values into a single number