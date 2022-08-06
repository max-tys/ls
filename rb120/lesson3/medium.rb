# Question 4

# class Greeting
#   def greet(message)
#     puts message
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("Goodbye")
#   end
# end

# Hello.new.hi
# Goodbye.new.bye

# Question 5

# class KrispyKreme
#   attr_reader :filling_type, :glazing

#   def initialize(filling_type, glazing)
#     @filling_type = filling_type == nil ? "Plain" : filling_type
#     @glazing = glazing
#   end

#   def to_s
#     glazing == nil ? "#{filling_type}" : "#{filling_type} with #{glazing}"
#   end
# end

# donut1 = KrispyKreme.new(nil, nil)
# donut2 = KrispyKreme.new("Vanilla", nil)
# donut3 = KrispyKreme.new(nil, "sugar")
# donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
# donut5 = KrispyKreme.new("Custard", "icing")

# puts donut1 # "Plain"
# puts donut2 # "Vanilla"
# puts donut3 # "Plain with sugar"
# puts donut4 # "Plain with chocolate sprinkles"
# puts donut5 # "Custard with icing"

# Question 6

# The only real difference lies in how the create_template instance methods are defined.
# In the first example, we reference and reassign the instance variable directly with the @template notation.
# In the second example, we do not refer to the instance variable directly. Instead, we reassign it with a setter method that is automatically defined by attr_accessor.
# The keyword self in self.template refers to the calling object, which will be an instance of the Computer class.

# Although the show_template instance methods are defined differently, there is no real difference in how the code works.
# In the first example, we rely on a getter method that's automatically defined by attr_accessor to access the value of @template.
# In the second example, we prepend the self keyword to template, i.e. self.template.
# Since self refers to the calling object, which is an instance of the Computer class, we are also invoking the getter method that was defined by attr_accessor.
# Self is not needed in this example. The getter method does not require self.

