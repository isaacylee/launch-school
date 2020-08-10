def ascii_value(string)
  char_values = string.chars.map{ |char| char = char.ord }
  char_values.reduce(0, :+)
end

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0