def triangle(n)
  (n).times do |num|
    puts (("*" * (num + 1)).rjust(n))
  end
end