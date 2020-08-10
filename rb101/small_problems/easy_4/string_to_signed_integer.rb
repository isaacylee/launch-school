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

def string_to_signed_integer(str)
  case str[0]
  when '-' then -string_to_integer(str[1..-1])
  when '+' then string_to_integer(str[1..-1])
  else          string_to_integer(str)
  end    
end