# 21. Using the following code, create two classes - Truck and Car - that both inherit from Vehicle.

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994)
# puts truck1.year

# car1 = Car.new(2006)
# puts car1.year

# 22. Start the Engine (Part 1)
# Change the following code so that creating a new Truck automatically invokes #start_engine.

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   def start_engine
#     puts 'Ready to go!'
#   end

#   def initialize(year)
#     super
#     start_engine
#   end
# end

# truck1 = Truck.new(1994)
# puts truck1.year

# 23. Only Pass the Year
# Using the following code, allow Truck to accept a second argument upon instantiation.
# Name the parameter bed_type and implement the modification so that Car continues to only accept one argument.

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   attr_reader :bed_type

#   def initialize(year, bed_type)
#     super(year)
#     @bed_type = bed_type
#   end
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994, 'Short')
# puts truck1.year # 1994
# puts truck1.bed_type # Short

# 24. Start the Engine (Part 2)
# Given the following code, modify #start_engine in Truck by appending 'Drive fast, please!'
# to the return value of #start_engine in Vehicle.
# The 'fast' in 'Drive fast, please!' should be the value of speed.

# class Vehicle
#   def start_engine
#     'Ready to go!'
#   end
# end

# class Truck < Vehicle
#   def start_engine(speed)
#     super() + " Drive #{speed}, please!"
#   end
# end

# truck1 = Truck.new
# puts truck1.start_engine('fast')

# 25. Towable (Part 1)
# Using the following code,
# create a Towable module that contains a method named tow
# that prints I can tow a trailer! when invoked.
# Include the module in the Truck class.

# 26. Towable (Part 2)
# Using the following code, create a class named Vehicle that,
# upon instantiation, assigns the passed in argument to @year.
# Both Truck and Car should inherit from Vehicle.

# module Towable
#   def tow
#     puts "I can tow a trailer!"
#   end
# end

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   include Towable
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994)
# puts truck1.year
# puts truck1.tow

# car1 = Car.new(2006)
# puts car1.year

# 27. Method Lookup (Part 1)
# Using the following code, determine the lookup path used when invoking cat1.color.
# Only list the classes that were checked by Ruby when searching for the #color method.

# class Animal
#   attr_reader :color

#   def initialize(color)
#     @color = color
#   end
# end

# class Cat < Animal
# end

# class Bird < Animal
# end

# cat1 = Cat.new('Black')
# cat1.color
# p Cat.ancestors # [Cat, Animal, Object, Kernel, BasicObject]
# Ruby stops looking when it finds Animal#color

# 28. Method Lookup (Part 2)
# Using the following code, determine the lookup path used when invoking cat1.color.
# Only list the classes and modules that Ruby will check when searching for the #color method.

# class Animal
# end

# class Cat < Animal
# end

# class Bird < Animal
# end

# cat1 = Cat.new
# cat1.color # [Cat, Animal, Object, Kernel, BasicObject]
# Ruby looks in every class and module in the search path.

# 29. Method Lookup (Part 3)
# Using the following code, determine the lookup path used when invoking bird1.color.
# Only list the classes or modules that were checked by Ruby when searching for the #color method.

# module Flyable
#   def fly
#     "I'm flying!"
#   end
# end

# class Animal
#   attr_reader :color

#   def initialize(color)
#     @color = color
#   end
# end

# class Cat < Animal
# end

# class Bird < Animal
#   include Flyable
# end

# bird1 = Bird.new('Red')
# bird1.color
# p Bird.ancestors # [Bird, Flyable, Animal, Object, Kernel, BasicObject]
# Ruby will look at Bird, Flyable, and Animal only.
# Modules are searched before the superclass(es).

# 30. Transportation
# Create a module named Transportation that contains three classes: Vehicle, Truck, and Car.
# Truck and Car should both inherit from Vehicle.

module Transportation
  class Vehicle; end

  class Truck < Vehicle; end

  class Car < Vehicle; end
end