def center_of(str)
  center = str.size/2
  if str.size.odd?
    str[center]
  else
    str[(center - 1)..center]
  end
end