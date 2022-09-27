class Triangle
  attr_reader :sides

  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3]
    raise ArgumentError.new("Invalid triangle lengths") if invalid_triangle?
  end

  def kind
    case unique_sides
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    else        'scalene'
    end
  end

  private

  def unique_sides
    sides.uniq.count
  end

  def invalid_triangle?
    zero_or_negative_size? || open_triangle?
  end

  def zero_or_negative_size?
    sides.any? { |side| side <= 0 }
  end

  def open_triangle?
    sorted_sides = sides.sort
    sorted_sides.first(2).sum <= sorted_sides.last
  end
end