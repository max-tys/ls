###############################
#  Practice Problems: Easy 2  #
###############################

=begin
# Question 1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.key? "Spot"
ages["Spot"]
ages.include? "Spot"
ages.member? "Spot"

# Question 2

munsters_description = "The Munsters are creepy in a good way."

puts munsters_description.swapcase
puts munsters_description.capitalize
puts munsters_description.downcase
puts munsters_description.upcase

# Question 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge(additional_ages)

# Question 4

advice = "Few things in life are as important as house training your pet dinosaur."

advice.include? "Dino"
# Or advice.match?("Dino")

# Question 5
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 6

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << 'Dino'

# Question 7
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(['Dino', 'Hoppy'])
# or flintstones.push('Dino').push('Hoppy')
# or flintstones.concat(%w(Dino Hoppy))

# Question 8

advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!("Few things in life are as important as ")
# Or puts advice.slice!(0, advice.index('house'))

# Question 9
statement = "The Flintstones Rock!"
statement.count('t')

# Question 10

title = "Flintstone Family Members"
title.center(40, ' ')
# or title.center(40)

=end
