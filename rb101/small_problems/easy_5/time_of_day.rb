MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24


def time_of_day(int)
hours, minutes = int.divmod(MINUTES_PER_HOUR)
hours = hours % HOURS_PER_DAY

format('%02d:%02d', hours, minutes)
end


time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"