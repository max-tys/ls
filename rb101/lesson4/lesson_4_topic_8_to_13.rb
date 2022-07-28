##############################################
# 11. Practice Problems: Additional Practice #
##############################################

# Practice Problem 1
# Turn this array into a hash where the names are the keys and the values are the positions in the array.
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# hash = {}
# flintstones.each_with_index { |name, index| hash[name] = index }
# p hash

# Practice Problem 2
# Add up all of the ages from the Munster family hash
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# p ages.values.sum

# Practice Problem 3
# Remove people with ages 100 and greater.
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# p ages.select { |_, age| age < 100 }

# Practice Problem 4
# Pick out the minimum age from our current Munster family hash:
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# p ages.values.sort.shift # or ages.values.min

# Practice Problem 5
# Find the index of the first name that starts with "Be"
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# p flintstones.index { |name| name.match(/\bBe/) }

# Practice Problem 6
# Amend this array so that the names are all shortened to just the first three characters:
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones.map! { |name| name[0,3] }
# p flintstones

# Practice Problem 7
# Create a hash that expresses the frequency with which each letter occurs in this string
# statement = "The Flintstones Rock"
# frequency = Hash.new(0)
# statement.delete(' ').chars.each { |char| frequency[char] += 1 }
# p frequency

# Practice Problem 8
# What happens when we modify an array while we are iterating over it? What would be output by this code?

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end
# 1 [index 0 in [1,2,3,4]], remove 1 => [2,3,4]
# 3 [index 1 in [2,3,4]], remove 2 => [3,4]
# Since index 2 does not exist in [3,4], each stops iterating.

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   number
#   numbers.pop(1)
# end
# 1 [index 0 in [1,2,3,4]], remove 4 => [1,2,3]
# 2 [index 1 in [1,2,3]], remove 3 ==> [1,2]
# Since index 2 does not exist in [1,2], each stops iterating

# Practice Problem 9
# Write your own version of the rails titleize implementation.
# words = "the flintstones rock"
# capitalized_array = words.split.map { |word| word.capitalize }
# capitalized_words = capitalized_array.join(' ')
# p capitalized_words

# Practice Problem 10
# Modify the hash such that each member of the Munster family has an additional "age_group" key

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each_value do |attributes|
#   attributes["age_group"] = if attributes["age"] < 18
#                               "kid"
#                             elsif attributes["age"] < 65
#                               "adult"
#                             else
#                               "senior"
#                             end
# end
# p munsters
