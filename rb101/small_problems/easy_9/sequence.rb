def sequence(num)
  if num > 0
    (1..num).to_a
  else 
    (num..-1).to_a
  end
end