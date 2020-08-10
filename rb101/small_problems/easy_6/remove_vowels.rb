VOWELS = "aeiouAEIOU"

def remove_vowels(arr)
  arr.map { |word| word.delete("aeiouAEIOU") }
end
