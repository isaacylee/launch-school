def letter_case_counter(str)
  result = {}
  chars = str.chars

  result[:lowercase] = chars.filter{|char| char.match?(/[a-z]/)}.size
  result[:uppercase] = chars.filter{|char| char.match?(/[A-Z]/)}.size
  result[:neither] = chars.filter{|char| char.match?(/[^a-z]/i)}.size

  result
end