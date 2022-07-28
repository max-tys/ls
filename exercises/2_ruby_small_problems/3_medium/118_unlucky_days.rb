# Write a method that returns the number of Friday the 13ths in the year given by an argument.
# You may assume that the year is greater than 1752
# (when the United Kingdom adopted the modern Gregorian Calendar)
# and that it will remain in use for the foreseeable future.

require 'date'

# Original implementation - brute force each day of the year
# def friday_13th(year)
#   d = Date.new(year, 1, 1)

#   days_in_year = d.leap? ? 366 : 365

#   count = 0

#   1.upto(days_in_year) do
#     count += 1 if d.cwday == 5 && d.day == 13
#     d += 1
#   end

#   count
# end

# Faster implementation - find the first Fri and check each subsequent Fri
# def friday_13th(year)
#   d = Date.new(year, 1, 1)

#   # Find the first Friday
#   loop do
#     break if d.cwday == 5
#     d += 1
#   end

#   count = 0

#   # Loop all subsequent Fridays, count++ if Fri lands on 13th day of the month.
#   loop do
#     count += 1 if d.day == 13
#     d += 7
#     break if d > Date.new(year, 12, 31)
#   end

#   count
# end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

# Further exploration - count no of months with 5 Fridays.

# Find the first Friday of the year.
def first_friday(year)
  date = Date.new(year, 1, 1)

  while date.cwday != 5
    date += 1
  end

  date
end

# Find every other Friday date in that year.
def all_fridays_in_year(date)
  fridays = []
  year = date.year

  while date < Date.new(year, 12, 31)
    fridays << date
    date += 7
  end

  fridays
end

# Count the number of Friday dates per month.
def fridays_per_month(fridays)
  fridays.each_with_object(Hash.new(0)) do |friday, count|
    count[friday.mon] += 1
  end
end

# Main method
def months_with_five_fridays(year)
  start_date = first_friday(year)

  fridays = all_fridays_in_year(start_date)

  friday_frequency = fridays_per_month(fridays)

  friday_frequency.select { |k, v| v == 5 }.size
end

p months_with_five_fridays(2015)
p months_with_five_fridays(2016)
p months_with_five_fridays(2022)
