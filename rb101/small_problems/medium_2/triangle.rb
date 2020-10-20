def triangle(side1, side2, side3)
  sides = [side1, side2, side3]

  if valid_triangle?(sides)
    case sides.uniq.size
    when 1 then :equilateral
    when 2 then :isoceles
    else        :scalene
    end
  else
    :invalid
  end
end

def valid_triangle?(arr)
  arr.sort!

  (arr[0] + arr[1] > arr[2]) && arr.include?(0) == false
end

