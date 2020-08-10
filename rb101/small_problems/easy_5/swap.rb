def first_last_letter_swap(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(str)
  str = str.split.map { |word| first_last_letter_swap(word) }
  str.join(' ')
end




