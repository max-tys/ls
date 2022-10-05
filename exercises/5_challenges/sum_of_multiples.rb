class SumOfMultiples
  attr_reader :multiples

  def initialize(*multiples)
    @multiples = multiples.empty? ? [3, 5] : multiples
  end

  def to(num)
    multiples.each_with_object([0]) do |n, arr|
      arr.concat(find_multiples(n, num))
    end.uniq.sum
  end

  def self.to(num)
    SumOfMultiples.new.to(num)
  end

  private

  def find_multiples(n, num)
    multiples = []
    current_multiple = n

    while current_multiple < num
      multiples << current_multiple
      current_multiple += n
    end

    multiples
  end
end