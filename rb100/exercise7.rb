# Optional parameters
=begin
def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}."
  else
    puts "Hi, my name is #{name}. I'm #{options[:age]} years old" + 
          ", and I live in #{options[:city]}."
  end 
end

greeting("Max")
greeting("Max", age: 62, city: "New York City")
=end

# Exercise 7

# Question 1
=begin
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
imm_fam = family.select do |key, value|
  key == :sisters || key == :brothers
end

p imm_fam_names = imm_fam.values.flatten
# use p instead of puts. p gives you the array as it is.
=end

# Question 2
=begin
h1 = { netflix: 183, alphabet: 2207 }
h2 = { tcl: 4.29, amazon: 2146 }
puts "merge is temporary"
p h1.merge(h2)
p h1
puts "merge! is permanent"
p h1.merge!(h2)
p h1
=end

# Question 3
=begin
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
family.each { |k,v| p k } # or use .each_key
family.each { |k,v| p v } # or use .each_value
family.each { |k,v| p "#{k}: #{v}" }
=end

# Question 4

# person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
# Access the name of the person by typing this:
# person[:name]

# Question 5
=begin
hash = { netflix: 183, alphabet: 2207 }
puts hash.has_value?(183) ? "hash contains the value" : "hash does not contain the value"
=end

# Question 6
# my_hash uses the symbol :x as the key.
# my_hash2 uses the string "hi there" as the key.

# Question 7
# B - there is no method called keys for array objects.