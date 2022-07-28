# More Stuff

# Question 1
=begin
def seq_check(string)
  puts string if /lab/ =~ string
end 

seq_check("laboratory")
seq_check("experiment")
seq_check("Pans Labyrinth")
seq_check("elaborate")
seq_check("polar bear")
=end

# Question 2

# The program will not print anything.
# The block must be activated with the .call method first.
# The method returns a Proc object.

# Question 3

# Exception handling resolves potential errors in the code.
# It allows the program to run even if the prog runs into an error.

# Question 4
=begin
def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }
=end

# Question 5

# The method expects a variable as a parameter, but we gave it a block instead.
# We can fix this with def execute(&block).
# The parameter is now a block.