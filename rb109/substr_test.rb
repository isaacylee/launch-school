# Given 2 strings, see if there is a substring that appears in both strings. You will return true if there is one, false otherwise. This is not case-sensitive. Only care about substrings longer than one letter long.

# Input : 2 strings
# Output: Boolean, true if common substring, otherwise false

# Algorithm
# Create an array of substrings for 1 string.
#   Initialize output array
#   Iterate from starting index of 0 to length of string.
#   Iterate from 2 to length of string minus the starting index as length of substring.
#    Slice substring with starting index and length and append to output array.
# See if any of the substrings are included in the other string.

def substring_test(str1, str2)
  substrings1 = substrings(str1.downcase)
  substrings1.any? { |substr| str2.downcase.include?(substr)}
end

def substrings(str)
  substrings = []
  (0...str.length).each do |starting_index|
    (2..(str.length - starting_index)).each do |length|
      substrings << str[starting_index, length]
    end
  end
  substrings
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true

