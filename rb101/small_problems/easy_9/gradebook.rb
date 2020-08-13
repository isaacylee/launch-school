def get_grade(grade1, grade2, grade3)
  average = (grade1 + grade2 + grade3) / 3
  case 
  when (90..100).include?(average) then "A"
  when (80...90).include?(average) then "B"
  when (70...80).include?(average) then "C"
  when (60...70).include?(average) then "D"
  else                                  "F"
  end
end
