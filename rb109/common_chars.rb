# Given an array of strings of lower-case letters, return an array of all characters that show up in all strings within the given array (including duplicates). For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.

# Algorithm
# Find the shortest string
#   Sort the input array by string length and take the first element
# Initialize a common_chars array.
# Iterate through the characters of the string
#   See if all the strings the input array include the character.
#   if this is true, map out how many times the character is included in the string.
#     Take the smallest value from the character count array
#     Append the character to the common_chars array that many times.

def common_chars(arr)
  short_str = arr.sort_by { |str| str.length }.first
  common_chars = []

  short_str.chars.uniq.each do |char|
    next unless arr.all? { |str| str.include?(char) }
    small_count = arr.map { |str| str.count(char) }.min
    small_count.times { common_chars << char }
  end

  common_chars
end

p common_chars(["bella", "label", "roller"])
p common_chars(['cool', 'lock', 'cook'])