# Good up to 3,999

class RomanNumeral
  ONES = %w(I X C M)
  FIVES = %w(V L D)

  attr_reader :arabic_numeral

  def initialize(arabic_numeral)
    @arabic_numeral = arabic_numeral
  end

  def to_roman
    roman_numeral = ''
    arabic_numeral.digits.each_with_index do |digit, position|
      next if digit.zero?
      roman_numeral.prepend(convert_digit(digit, position))
    end
    roman_numeral
  end

  private

  def convert_digit(digit, position)
    one_symbol = ONES[position]
    five_symbol = FIVES[position]
    ten_symbol = ONES[position + 1]

    case digit
    when 1..3 then one_symbol * digit
    when 4    then one_symbol + five_symbol
    when 5    then five_symbol
    when 6..8 then five_symbol + one_symbol * (digit - 5)
    when 9    then one_symbol + ten_symbol
    end
  end
end
