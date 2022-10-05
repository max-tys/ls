require 'date'

class Meetup
  attr_reader :year, :month
  attr_accessor :date

  WEEKDAYS = %w(sunday monday tuesday wednesday thursday friday saturday)
  TEENTHS = (13..19).to_a

  def initialize(year, month)
    @year = year
    @month = month
    @date = Date.new(year, month)
  end

  # Returns a Date object
  def day(weekday, schedule)
    weekday = weekday.downcase
    schedule = schedule.downcase

    case schedule
    when 'first'  then find_first_date(weekday)
    when 'second' then find_first_date(weekday) + 7
    when 'third'  then find_first_date(weekday) + 14
    when 'fourth' then find_first_date(weekday) + 21
    when 'fifth'  then find_fifth_date(weekday)
    when 'last'   then find_last_date(weekday)
    when 'teenth' then find_teenth_date(weekday)
    end
  end

  private

  # Returns a Date object
  def find_first_date(weekday)
    target_wday = WEEKDAYS.index(weekday)
    loop do
      break if date.wday == target_wday
      self.date = date.next_day
    end
    date
  end

  # Return nil if we cross over to the next month, i.e. no fifth weekday
  def find_fifth_date(weekday)
    new_date = find_first_date(weekday) + 28
    new_date.month == month ? new_date : nil
  end

  # Look for the first weekday of the next month, then go back a week
  def find_last_date(weekday)
    self.date = date >> 1
    find_first_date(weekday) - 7
  end

  # Find the first weekday, then add 7 until the date is between 13 and 19
  def find_teenth_date(weekday)
    self.date = find_first_date(weekday)
    self.date += 7 until TEENTHS.include?(date.day)
    date
  end
end