# Create a class called MyCar.
  # When you initialize a new instance or object of the class,
  # allow the user to define some instance variables that tell us the year, color, and model of the car.

  # Create an instance variable that is set to 0 during instantiation of the object
  # to track the current speed of the car as well.

  # Create instance methods that allow the car to speed up, brake, and shut the car off.

# Add an accessor method to your MyCar class to change and view the color of your car.
# Then add an accessor method that allows you to view, but not modify, the year of your car.

# You want to create a nice interface that allows you to accurately describe the action you want your program to perform.
# Create a method called spray_paint that can be called on an object and will modify the color of the car.

# Add a class method to your MyCar class that calculates the gas mileage of any car.

# Override the to_s method to create a user friendly print out of your object.

class MyCar
  attr_accessor :color, :speed
  attr_reader :year, :model

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @speed = 0
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
    puts "The color of your car is now #{@color}."
  end

  def self.gas_mileage(miles, gallons)
    puts "The gas mileage is #{miles.fdiv(gallons).round(2)} miles per gallon."
  end

  def to_s
    "You have a #{color} #{year} #{model.capitalize}."
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up
lumina.brake
lumina.speed
lumina.shut_down
lumina.spray_paint('red')
MyCar.gas_mileage(132, 11)
puts lumina
