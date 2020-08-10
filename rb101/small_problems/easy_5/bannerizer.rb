def bannerizer(str)
  top_bottom_border = "+#{'-' * (str.length + 2)}+"
  side_border = "|#{' ' * (str.length + 2)}|"

  puts top_bottom_border
  puts side_border
  puts "| #{str} |"
  puts side_border
  puts top_bottom_border
end

def str_chopper(str)
  
end