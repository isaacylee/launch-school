def crunch(str)
  trimmed = []
  letters = str.split('')
  letters.each do |letter|
    trimmed << letter unless trimmed.last == letter
  end
  trimmed.join
end