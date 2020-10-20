CONSONANTS = ('a'..'z').to_a.difference(%w(a e i o u))

def double_consonants(str)
  new_str = ''

  str.each_char do |char|
    if CONSONANTS.include?(char.downcase)
      new_str << char << char
    else
      new_str << char
    end
  end

  new_str
end
