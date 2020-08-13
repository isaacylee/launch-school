def swap_name(name)
  full_name = name.split
  first_name = full_name[0]
  last_name = full_name[1]
  "#{last_name}, #{first_name}"
end