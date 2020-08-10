def str_palindrome?(str)
  str == str.reverse
end

str_palindrome?('madam') == true
str_palindrome?('Madam') == false          # (case matters)
str_palindrome?("madam i'm adam") == false # (all characters matter)
str_palindrome?('356653') == true

def array_palindrome?(arr)
  arr == arr.reverse
end

array_palindrome?([1, 2, 3])
array_palindrome?([1, 2, 1])

def palindrome?(arg)
  arg == arg.reverse
end

palindrome?("Hello")# => false
palindrome?("tacocat")# => true
palindrome?([1, 3, 4])# => false
palindrome?([1, 3, 1])# => true