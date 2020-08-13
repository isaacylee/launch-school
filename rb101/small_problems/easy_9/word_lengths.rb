def word_lengths(str)
  words = str.split
  result = []
  words.each{|word| result << "#{word} #{word.length}"}
  result
end
