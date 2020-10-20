require 'date'

def friday_13th(year)
  d = Date.new(year, 1, 13)
  unlucky_days = 0

  loop do
    unlucky_days += 1 if d.friday?
    d = d >> 1 # This moves to the next month by n 
    break if d.year != year
  end

  unlucky_days
end

def five_fridays(year)
  d = first_friday(year)
  current_m = d.month
  five_fridays = 0

  loop do
    fridays = 0
    while d.month == current_m
      fridays += 1 if d.friday?
      d += 7
    end
    five_fridays += 1 if fridays == 5
    current_m += 1
    break if d.year != year
  end

  five_fridays
end

def first_friday(year)
  d = Date.new(year)
  d += 1 until d.friday?
  d
end