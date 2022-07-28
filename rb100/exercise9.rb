# Final Exercises for Intro to Ruby

=begin

# Question 1

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array.each { |num| puts num }

# Question 2

big_num_array = array.select { |num| num > 5 }
p big_num_array

# Question 3

big_odd_num_array = big_num_array.select { |num| num % 2 != 0 }
p big_odd_num_array

# Question 4

array.unshift(0).push(11)

# Question 5

array.pop
array << 3

# Question 6

array.uniq

# Question 7

# An array is an ordered list of variables.
# A hash is an ordered list of key-value pairs.

# Question 8

hash1 = { key: "value" }
hash2 = { :key => "value" }

# Question 9

h1 = {a:1, b:2, c:3, d:4}
p h1[:b]
h2 = {e:5}
p h1.merge!(h2)
p h1.delete_if { |k,v| v < 3.5 }

# Question 10

# Yes, hash values can be arrays.
# { key: [1,2,3,4,5] }
# Yes, you can have an array of hashes.
# [ {k1: v2}, {k2: v2}]

# Question 11

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

 contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts.each_with_index do |(key, value), index|
  contacts[key][:email] = contact_data[index][0]
  contacts[key][:address] = contact_data[index][1]
  contacts[key][:phone] = contact_data[index][2]
end

p contacts

# Question 12

p contacts["Joe Smith"][:email]
p contacts["Sally Johnson"][:phone]

# Question 13

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
p arr.delete_if { |string| string.start_with?('s') }
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
p arr.delete_if { |string| string.start_with?('s', 'w') }

# Question 14

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

p a = a.map { |phrase| phrase.split }.flatten

=end

# Question 15

# These hashes are the same.
# Documentation - two hashes are equal if the number of keys is the same,
# and if each key-value pair is equal to the corresponding elements.

# Question 16

# Refer to solution in Question 11.
# Improvement - nest a 'each' method for the fields.