# We wrote a method for moving a given number of elements from one array to another.
# We decide to test it on our todo list,
# but invoking move on line 11 results in a SystemStackError.
# What does this error mean and why does it happen?

def move(n, from_array, to_array)
  # return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# The SystemStackError tells us that we have utilized all of the stack slots in the computer's memory.
# This is because `move` does not have a base case.
# Without a base case, `move` will call itself recursively ad infinitum.
# To fix this, we tell `move` to return from itself when n is equal to 0.
