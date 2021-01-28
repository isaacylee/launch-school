def diamond(n)
  distance_from_center = n / 2

  until distance_from_center == 0
    p ('*' * (n - distance_from_center * 2)).center(n)
    distance_from_center -= 1
  end
  
  until distance_from_center > n / 2
    p ('*' * (n - distance_from_center * 2)).center(n)
    distance_from_center += 1
  end

end


diamond(9)