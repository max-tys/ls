# Original solution
=begin
def standardize_minute(minute)
  if minute >= 1440
    loop do
      minute -= 1440
      break if minute < 1440
    end
  end

  if minute < 0
    loop do
      minute += 1440
      break if minute > 0
    end
  end

  minute
end

def time_of_day(minute)
  minute = standardize_minute(minute)
  hour_minute = minute.divmod(60)
  hour = format('%02d', hour_minute[0])
  minute = format('%02d', hour_minute[1])
  "#{hour}:#{minute}"
end
=end

# Standard solution
# Consider defining a few constants to avoid any mystery numbers in the method.
=begin
def standardize_minute(minute)
  minute = minute % 1440
end

def time_of_day(minute)
  std_minute = standardize_minute(minute)
  hours, minutes = std_minute.divmod(60)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
=end

# Problem 2 - Using Ruby's date and time class.
=begin
SECONDS = 60

def time_of_day(minute)
  # Time.at takes the number of seconds since the Unix Epoch.
  seconds_since_midnight = Time.at(minute * SECONDS)
  seconds_since_midnight.strftime("%H:%M")
end
=end

# Problem 3 - Building on problem 2, include day of the week.
# We start at midnight on Sunday.
SECONDS = 60

def time_of_day(minute)
  # 29 May 2022 is a Sunday.
  t = Time.new(2022,5,29)

  # We add or subtract minutes from 0:00 on 29 May 2022.
  t = t + (minute * SECONDS)

  # %A gives us the full weekday name e.g. Sunday.
  t.strftime("%A %H:%M")
end
