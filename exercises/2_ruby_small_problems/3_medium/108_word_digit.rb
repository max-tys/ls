# Write a method that takes a sentence string as input,
# and returns the same string with any sequence of the words
# zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'
# converted to a string of digits.

# Original solution
def word_to_digit(sentence)
  english_numbers = %w(zero one two three four five six seven eight nine)
  regex = /\b(zero|one|two|three|four|five|six|seven|eight|nine)\b/

  sentence.split.map do |word|
    word.gsub(regex) { |english_number| english_numbers.index(english_number)}
  end.join(' ')
end

num_sentence = word_to_digit('Please call me at nine one seven one two three four five six seven. Thanks.')

# Further exploration - remove spaces between consecutive numbers.

def remove_num_spaces(sentence)
  sentence.gsub(/(\d )+/) { |num_with_space| num_with_space.delete(' ') }
end

clean_num_sentence = remove_num_spaces(num_sentence)

# Further exploration - format 10-digit phone numbers

def phone_format(sentence)
  sentence.gsub(/\b\d{10}\b/) do |phone_num|
    string_digits = phone_num.to_s.chars
    format('(%s) %s-%s', string_digits[0..2].join, string_digits[3..5].join, string_digits[6..9].join)
  end
end

p phone_format(clean_num_sentence)
