def word_sizes(str)
  result = {}

  sizes = str.split.map(&:size)

  sizes.each do |size|
    unless result.has_key?(size)
      result[size] = 1
    else
      result[size] += 1
    end
  end
  result
end

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

# This solution works, but the unless/else logic can be avoided
# by initializing the hash using Hash.new(0) to default non-existing keys
# value to 0

def word_sizes_refactored(str)
  result = Hash.new(0)
  str.split.each do |word|
    result[word.size] += 1
  end
  result
end

# Modify to exclude special characters

def word_sizes_letters_only(str)
  result = Hash.new(0)

  str.gsub(/[^a-z ]/i, "").split.each do |word|
    result[word.size] += 1
  end
  result
end

word_sizes_letters_only("hello! my name is Isaac.")