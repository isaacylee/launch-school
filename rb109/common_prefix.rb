# Write a method to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string ''.

# Input: an Array of Strings
# Output: String ('' or the longest common prefix of all strings in the array)

# Algorithm
# Initialize an empty string for the prefix.
# Transform input array of strings to an array of array of characters.
# Remove a word from the array and assign a variable to it. This will be a reference string to compare all other strings to.
# Iterate through each char of the test string, check if each string has the same value.
#  If this is true, add it to the empty string.
#  Else, break from this iteration.
# Return the common prefix string.

def common_prefix(arr)
  common_prefix = ''
  arr = arr.map { |str| str.chars }
  test_str = arr.pop
  
  test_str.each_with_index do |char, idx|
    if arr.all? { |chars| chars[idx] == char }
      common_prefix << char
    else
      break
    end
  end

  common_prefix
end

p common_prefix(['flower', 'flow', 'flight']) #== 'fl'
p common_prefix(['dog', 'racecar', 'car']) #== ''
p common_prefix(['interspecies', 'interstellar', 'interstate']) #== 'inters'
p common_prefix(['throne', 'dungeon']) #== ''
p common_prefix(['throne', 'throne']) #== 'throne'
