def multisum(num)
  multiples = []
  num.times do |i| 
    if (i + 1) % 3 == 0 || (i + 1) % 5 == 0
      multiples << (i + 1)
    end
  end
  multiples.reduce(0, :+)
end

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168