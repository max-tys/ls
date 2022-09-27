class PerfectNumber
  def self.classify(number)
    raise StandardError.new("Input cannot be less than 1") if number < 1
    aliquot = sum_of_factors(number)
    case
    when aliquot < number  then 'deficient'
    when aliquot == number then 'perfect'
    when aliquot > number  then 'abundant'
    end
  end

  class << self
    private

    def sum_of_factors(number)
      factors = [1]
      2.upto(number / 2) do |n|
        break if factors.include? n
        factors << n if number % n == 0
      end
      factors.sum
    end
  end
end