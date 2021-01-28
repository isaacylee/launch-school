# Write the length of the longest substr that is a palindrome.

def longest_palindrome(str)
  return 0 if str == ''
  substrings = substrings(str)
  palindrome_substr = substrings.select { |substr| is_palindrome?(substr) }
  palindrome_substr.map { |substr| substr.length}.sort.last
end

def substrings(str)
  substrings = []
  (0..str.length).each do |start_idx|
    (1..(str.length - start_idx)).each do |length|
      substrings << str[start_idx, length]
    end
  end
  substrings
end

def is_palindrome?(str)
  str == str.reverse
end


p longest_palindrome('a')
p longest_palindrome('aa')
p longest_palindrome('baa')
p longest_palindrome('aab')
p longest_palindrome('baabcd')
p longest_palindrome('baablkj12345432133d')