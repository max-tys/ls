class FixedArray
  attr_accessor :array, :size

  def initialize(size)
    @array = Array.new(size)
    @size = size
  end

  def [](index)
    # For an array with 5 elements, the index should be between -4 and 4
    if in_range?(index)
      array[index % size]
    else
      raise IndexError
    end
  end

  def []=(index, object)
    if in_range?(index)
      array[index % size] = object
    else
      raise IndexError
    end
  end

  def to_a
    array
  end

  def to_s
    string_elements = array.map do |element|
      element.nil? ? 'nil' : "\"#{element}\""
    end
    '[' + string_elements.join(', ') + ']'
  end

  private

  def in_range?(index)
    index < size && index > -size
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end