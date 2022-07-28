# The following code prompts the user to set their own password if they haven't done so already,
# and then prompts them to login with that password.
# However, the program throws an error. What is the problem and how can you fix it?

# Once you get the program to run without error, does it behave as expected?
# Verify that you are able to log in with your new password.

password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  new_password
end

def verify_password(pwd)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == pwd
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)

# The code raises a NameError on line 21.
# This is because we had attempted to compare local variable `input` to an uninitialized variable or an undefined method by the name of `password`.
# Although we had initialized `password` on line 8,
# `password` is not passed as an argument to the `verify_password` method,
# and the method does not have access to `password`.
# `password` is not in scope on line 21.
# Method create their own scope, and they do not have access to local variables in outer scopes.
# We can rectify this problem by passing `password` as an argument to the `verify_password` method.
