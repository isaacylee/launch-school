# Given a non-empty string, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assue the given string consists of lowercase English letters only.

# Input : a string (lowercase letters only)
# Output : boolean value 
#           True if the string can be constructed by multiples of one of its substrings
#           False otherwise

# Algorithm
# Create an array of the string's substrings with lengths up to half the string's length
#   Create an empty array
#   Create a new string that is the first half of the original string.
#   Iterate from zero to the length of the half string as the starting index
#     Iterate from 2 to the length of the half string minus the starting index as the length
#       Create substrings by accessing the half string using a starting index and length 
#       Append those to the array
# Check if any of the substrings multiplied by the length of the string divided by the length of the substring equals the original substring.

def repeated_substring_pattern(str)
  substrings = first_half_substrings(str)
  substrings.any? { |substr| substr * (str.length / substr.length) == str }
end

def first_half_substrings(str)
  substrings = []
  half_str = str[0, str.length / 2]

  (0...half_str.length).each do |starting_idx|
    (1..(half_str.length - starting_idx)).each do |length|
      substrings << half_str[starting_idx, length]
    end
  end

  substrings
end

p repeated_substring_pattern("aaaaa")
p repeated_substring_pattern("aba")
p repeated_substring_pattern("aabaaba")
p repeated_substring_pattern("abaababaab")
p repeated_substring_pattern("abcabcabcabc")