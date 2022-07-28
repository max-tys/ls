def decrease(counter)
  counter - 1
end

counter = 10

counter.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

=begin
On line 5, a local variable named counter is initialized to the integer 10.
On line 7, we call the times method on the object referenced by counter, i.e., 10.
This means that the do/end block from lines 7 to 10 will be executed 10 times.
We call the puts method on line 8 and pass the object referenced by counter as an argument.
Thus, the code outputs the current value of counter.
On line 9, we call the decrease method and pass counter as an argument to the method.
The parameter named counter, as we see on line 1, is assigned the value of the argument.
At this juncture, there are two variables named counter, and they are both pointing to the same object.
  The counter variable initialized on line 5 and the counter parameter of the decrease method are two independent variables.
  The counter parameter lives only within the scope of the method.
The decrease method subtracts 1 from the value of counter. The parameter now points to the integer 9.
We reassign the method parameter to the result of its value minus 1.
This changes the value of the counter parameter local to the method.
But this does not change the variable counter referenced on lines 5, 8 and 9.
The local variable initialized at line 5 still points to the integer 10.
We also don't use the return value of the method anywhere.
The counter variable outside the method continues to reference the integer 10.
This code will output the integer 10 for a total of 10 times.
Finally, it will output "LAUNCH!", as we see at line 12.
To fix this code, we can change line 9 to "counter = decrease(counter)."
This reassigns the variable counter to the return value of decrease(counter) each time we iterate through the block.
For clarity, we can remove the reassignment on line 2 in the method as that does not serve any purpose.
=end
