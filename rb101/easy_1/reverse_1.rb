def reverse_sentence(str)
  str.split.reverse.join(' ')        # split default parameter is ' '
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'