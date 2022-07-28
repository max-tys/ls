#######################################
# Review of quiz from RB101, lesson 4 #
#######################################

# ---------- #
# Question 8 #
# ---------- #

# # Original array

# array = %w(cat dog elephant)

# puts "The object id of the original array is #{array.object_id}."

# array.each_with_index do |animal, index|
#   puts "The object id of element #{index} "\
#       "of the selected array is #{animal.object_id}."
# end

# # Selected array

# selection = array.select { |animal| animal.length > 1 }
# puts "The object id of the selected array is #{selection.object_id}."

# selection.each_with_index do |animal, index|
#   puts "The object id of element #{index} "\
#       "of the selected array is #{animal.object_id}."
# end

# ----------- #
# Question 11 #
# ----------- #

# string = "Hello world!"
# p string.downcase
# p string

# ----------- #
# Question 19 #
# ----------- #

# countries_and_capitals = {
#   'France' => 'Paris',
#   'Belgium' => 'Brussels',
#   'Morocco' => 'Rabat',
#   'Barbados' => 'Bridgetown',
#   'Peru' => 'Lima',
#   'Bolivia' => 'La Paz',
#   'Brazil' => 'Brasilia'
# }

# def begins_with_b(string)
#   string[0] == 'B'
# end

# selection = countries_and_capitals.find_all do |country, capital|
#   begins_with_b(country)
# end

# p selection # Returns a nested array.

# selection = countries_and_capitals.select do |country, capital|
#   begins_with_b(country)
# end

# p selection # Returns a hash.

array = %w(harry potter ron weasley hermione granger)

selection = array.select { |word| word[0] == 'h' }
p selection

selection = array.find_all { |word| word[0] == 'h' }
p selection
