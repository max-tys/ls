SQM_TO_SQFT = 10.7639

puts 'Enter the length of the room in meters: '
length = gets.chomp.to_f

puts 'Enter the width of the room in meters: '
width = gets.chomp.to_f

area_sqm = (length * width).round(2)
area_sqft = ((length * width) * SQM_TO_SQFT).round(2)

puts "The area of the room is #{area_sqm} square meters"\
      " (#{area_sqft} square feet)."
