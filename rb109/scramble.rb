# Write a function that returns true if str1 characters can be rearranged to match str, otherwise false.

# Input: 2 strings
# Output: Boolean

# Algorithm
# Iterate through the characters and return true if ALL characters in str1 have a count that is equal to or greater than str2.

def scramble(str1, str2)
  str2.chars.all? do |char|
    str1.count(char) >= str2.count(char)
  end
end


p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('katas', 'steak') == false
p scramble('cedewaraaoossooqqyt', 'codewars') == true
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true


