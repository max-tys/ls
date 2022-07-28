# Original solution
=begin

MINUTES_IN_HOUR = 60
MINUTES_IN_DAY = 1440

def get_minutes(time)
  hours = time[0,2].to_i
  minutes = time[3,5].to_i
  total_minutes = (hours * MINUTES_IN_HOUR) + minutes
end

def after_midnight(time)
  get_minutes(time) % MINUTES_IN_DAY
end

def before_midnight(time)
  (1440 - get_minutes(time)) % MINUTES_IN_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

=end

# Further exploration with Date / Time classes

MINUTES_IN_HOUR = 60
MINUTES_IN_DAY = 1440

def get_minutes(time)
  hours = time[0,2].to_i
  minutes = time[3,5].to_i
  t = Time.new(1970, 1, 1, hours, minutes).to_i
  t / MINUTES_IN_HOUR
end

def after_midnight(time)
  get_minutes(time) % MINUTES_IN_DAY
end

def before_midnight(time)
  (1440 - get_minutes(time)) % MINUTES_IN_DAY
end
