class Clock
  attr_reader :hour, :minute
  MINUTES_IN_DAY = 60 * 24

  def initialize(hour, minute = 0)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute = 0)
    new(hour, minute)
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end

  def +(minute_delta)
    new_minute = minute + (minute_delta % MINUTES_IN_DAY)
    new_hour = hour

    while new_minute >= 60
      new_minute -= 60
      new_hour += 1
      new_hour -= 24 if new_hour >= 24
    end

    self.class.new(new_hour, new_minute)
  end

  def -(minute_delta)
    new_minute = minute - (minute_delta % MINUTES_IN_DAY)
    new_hour = hour

    while new_minute < 0
      new_minute += 60
      new_hour -= 1
      new_hour += 24 if new_hour < 0
    end

    self.class.new(new_hour, new_minute)
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end
end
