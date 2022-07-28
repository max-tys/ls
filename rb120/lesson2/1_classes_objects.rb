# 1. Given the below usage of the Person class, code the class definition.

# 2. Modify the class definition from above to facilitate the following methods.
# Note that there is no name= setter method now.

# 3. Now create a smart name= method that can take just a first name or a full name,
# and knows how to set the first_name and last_name appropriately.

# 4. Using the class definition from step #3, let's create a few more people -- that is, Person objects.
# If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?
# p bob.name == rob.name

# 5. Continuing with our Person class definition, what does the below print out?
# bob = Person.new("Robert Smith")
# puts "The person's name is: #{bob}" # outputs the bob object.

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(n)
    parts = n.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end

  def to_s
    name
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
