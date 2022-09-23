# 1 Internal vs External Iterators

# factorials = Enumerator.new do |y|
#   n = 0
#   n_factorial = 1

#   loop do
#     y << n_factorial
#     n += 1
#     n_factorial *= n
#   end
# end

# # External iteration
# 7.times { |n| puts "#{n}! = #{factorials.next}" }

# # The enumeration sequence continues from the previous iteration.
# 3.times { |n| puts "#{n}! = #{factorials.next}" }

# # #rewind tells the Enumerator that it's time to begin a new iteration.
# factorials.rewind
# 7.times { |n| puts "#{n}! = #{factorials.next}" }

# 2 Exploring Procs, Lambdas, and Blocks: Definition and Arity

# Group 1 - procs have lenient arity. Any no. of args is fine!
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc        #<Proc:0x00007f08491d7970 ../advanced1.rb:27>
puts my_proc.class  # Proc
my_proc.call        # This is a .
my_proc.call('cat') # This is a cat.

# Group 2 - lambdas have strict arity. You must give the exact no. of args.
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda          #<Proc:0x00007fc3176b7830..>
puts my_second_lambda   #<Proc:0x00007fc3176b77b8..>
puts my_lambda.class    # Proc
my_lambda.call('dog')   # This is a dog
my_lambda.call          # ArgumentError - given 0, expected 1
# NameError - uninitialized constant Lambda
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Group 3 - blocks have lenient arity insofar as block arguments are concerned
# methods have strict arity when it comes to blocks as arguments.
  # if you use yield in a method, you must pass a block as an argument
  # exception: you have a block_given? condition.
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}  # This is a .
block_method_1('seal') # LocalJumpError. No block given to yield.

# Group 4 - blocks have lenient arity.
  # if the block is defined to accept 2 arguments, and you only pass 1 arg
    # Ruby will assign the first parameter to the first argument.
def block_method_2(animal)
  yield(animal)
end

# This is a turtle.
block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}

# This is a turtle and a .
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end

# NameError. Undefined local variable or method 'animal'.
block_method_2('turtle') { puts "This is a #{animal}."}