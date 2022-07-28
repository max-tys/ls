def generate_age(name)
  # Or age = rand(20..200)
  age = (20..200).to_a.sample
  if name == ''
    puts "Teddy is #{age} years old!"
  else
    puts "#{name} is #{age} years old!"
  end
end

puts ">> What is your name?"
name = gets.chomp
5.times { generate_age(name) }
