def letter_percentages(str)
  letter_count = { lowercase: 0, uppercase: 0, neither: 0}

  str.chars.each do |char|
    if char.match?(/[a-z]/)
      letter_count[:lowercase] += 1.0
    elsif char.match?(/[A-Z]/)
      letter_count[:uppercase] += 1.0
    else
      letter_count[:neither] += 1.0
    end
  end

  total_characters = str.length

  letter_percentages = {}

  letter_count.each do | type , count |
    letter_percentages[type] = ((count / total_characters) * 100).round(1)
  end

  letter_percentages
end

letter_percentages("ABcd 123")