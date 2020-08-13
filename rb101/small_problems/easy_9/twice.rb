def twice(num)
  str = num.to_s
  if str.size.odd?
    num * 2
  elsif str[0, str.size/2] == str[str.size/2, str.size/2]
    num
  else
    num * 2
  end
end