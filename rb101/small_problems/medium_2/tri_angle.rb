def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  return :invalid if !(valid_triangle?(angles))

  case 
  when angles.count(90) == 1             then :right
  when angles.all?{ |angle| angle < 90 } then :acute
  when angles.one?{ |angle| angle > 90 } then :obtuse
  end

end

def valid_triangle?(angles)
  angles.reduce(0, :+) == 180 && angles.all? { |angle| angle > 0 }
end

