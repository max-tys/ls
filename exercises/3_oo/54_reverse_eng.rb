class Transform
  def initialize(data)
    @data = data
  end

  def self.lowercase(str)
    str.downcase
  end

  def uppercase
    @data.upcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase # ABC
puts Transform.lowercase('XYZ') # xyz
