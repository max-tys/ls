# Create a superclass called Vehicle for your MyCar class to inherit from
# and move the behavior that isn't specific to the MyCar class to the superclass.
# Create a constant in your MyCar class that stores information about the vehicle
# that makes it different from other types of Vehicles.

# Then create a new class called MyTruck that inherits from your superclass
# that also has a constant defined that separates it from the MyCar class in some way.

# Add a class variable to your superclass
# that can keep track of the number of objects created that inherit from the superclass.
# Create a method to print out the value of this class variable as well.

require 'time'

module Towable # module needs to come before class
  def tow(vehicle)
    puts "Your vehicle is now towing a #{vehicle}."
  end
end

class Vehicle

  attr_reader :year, :model, :color

  @@vehicle_count = 0

  def self.vehicle_count
    puts "There are #{@@vehicle_count} vehicles in your garage."
  end

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @speed = 0
    @@vehicle_count += 1
  end

  def speed_up(s=10)
    @speed += s
    puts "You accelerated by #{s} mph."
  end

  def brake(s=10)
    @speed > s ? @speed -= s : @speed = 0
    puts "You decelerated by #{s} mph."
  end

  def speed
    puts "Your speed is #{@speed} mph."
  end

  def shut_down
    @speed = 0
    puts "Shutting down..."
  end

  def spray_paint(new_color)
    @color = new_color
    puts "The color of your vehicle is now #{@color}."
  end

  def self.gas_mileage(miles, gallons)
    puts "The gas mileage is #{miles.fdiv(gallons).round(2)} miles per gallon."
  end

  def age
    puts "Your vehicle is #{calculate_age} years old."
  end

  private

  def calculate_age
    Time.now.year - @year
  end
end

class MyCar < Vehicle
  LICENSE = 'regular'

  def to_s
    "Your car is a #{color} #{year} #{model.capitalize}."
  end
end

class MyTruck < Vehicle
  include Towable

  LICENSE = 'commercial'

  def to_s
    "Your truck is a #{color} #{year} #{model.capitalize}."
  end
end

# mariah = MyCar.new(1997, 'chevy lumina', 'white')
# norris = MyTruck.new(2002, 'ford focus', 'gold')
# mariah.calculate_age

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(person)
    grade > person.grade
  end

  protected # instead of private

  def grade
    @grade
  end
end

joe = Student.new('joe', 85)
bob = Student.new('bob', 60)

puts "Well done!" if joe.better_grade_than?(bob)
