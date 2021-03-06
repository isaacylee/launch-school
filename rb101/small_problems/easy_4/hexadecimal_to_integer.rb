DIGITS = {
  "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4,
  "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9,
  "A" => 10, "B" => 11, "C" => 12, "D" => 13, "E" => 14, "F" => 15
}

def hexadec_to_integer(str)
  digits = str.upcase.chars
  digits = digits.map { |digit| digit = DIGITS[digit] }

  value = 0
  digits.each { |digit| value = 16 * value + digit}
  value
end

hexadec_to_integer('4D9f') # => 19871