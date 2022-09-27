class Octal
  attr_reader :octal

  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    decimal = 0
    return decimal if invalid_octal?

    octal.to_i.digits.each_with_index do |digit, exponent|
      decimal += digit * 8**exponent
    end

    decimal
  end

  private

  def invalid_octal?
    octal.chars.any? { |char| char =~ /[^0-7]/ }
  end
end