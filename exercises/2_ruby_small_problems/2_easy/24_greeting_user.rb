def greet(name)
  # Last character of a string can be accessed by name[-1] also.
  if name[name.length - 1] != '!'
    puts "Hello #{name}."
  else
    puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
  end
end

print 'What is your name? '
user_name = gets.chomp

greet(user_name)
