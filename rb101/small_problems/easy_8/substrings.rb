def leading_substrings(str)
  chars = str.chars
  holder = []
  chars.each_index{|idx| holder << chars[0..idx]}
  holder.map{|x| x.join}
end

def substrings(str)
  result = []
  while str.size > 0
    result << leading_substrings(str)
    str = str[1..-1]
  end
  result.flatten
end