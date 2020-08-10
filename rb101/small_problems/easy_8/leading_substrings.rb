def leading_substrings(str)
  chars = str.chars
  holder = []
  chars.each_index{|idx| holder << chars[0..idx]}
  holder.map{|x| x.join}
end