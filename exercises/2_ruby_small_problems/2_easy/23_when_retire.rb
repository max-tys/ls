print 'What is your age? '
age_current = gets.to_i

print 'At what age would you like to retire? '
age_retirement = gets.to_i

year_current = Time.now.year

work_years_to_go = age_retirement - age_current

year_retirement = year_current.to_i + work_years_to_go

puts "It's #{year_current}. You will retire in #{year_retirement}."
puts "You have only #{work_years_to_go} years of work to go!"
