CONSONANTS = ("a".."z").to_a.difference(%w(a e i o u))

def repeater(str)
  (str.chars).map{ |char| char * 2 }.join
end

def double_consonants(str)
  result = ''
  str.each_char do |char|
    if CONSONANTS.include?(char.downcase)
      result << char * 2
    else
      result << char
    end
  end
  result
end