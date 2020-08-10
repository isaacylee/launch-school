def hours_from_string(str)
  hours_minutes = str.split(':').map { |str| str.to_i}
  hours_minutes[0]
end

def minutes_from_string(str)
  hours_minutes = str.split(':').map { |str| str.to_i}
  hours_minutes[1]
end

def after_midnight(str)
  hours = hours_from_string(str)
  minutes = minutes_from_string(str)
  (hours * 60 + minutes) % 1440
end

def before_midnight(str)
  hours = 23 - hours_from_string(str)
  minutes = 60 - minutes_from_string(str)
  (hours * 60 + minutes) % 1440
end