# Write a method that takes a string,
# and then returns a hash that contains 3 entries:
# one represents the percentage of characters in the string that are lowercase letters,
# one the percentage of characters that are uppercase letters,
# and one the percentage of characters that are neither.
# You may assume that the string will always contain at least one character.

def letter_percentages(string)
  type_count = {
    lowercase: 0,
    uppercase: 0,
    neither:   0
  }

  string.chars.each do |char|
    if char.match(/[a-z]/)
      type_count[:lowercase] += 1
    elsif char.match(/[A-Z]/)
      type_count[:uppercase] += 1
    else
      type_count[:neither] += 1
    end
  end

  type_count.transform_values { |v| (v.to_f / string.size * 100).round(1) }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI') == {lowercase: 66.7, uppercase: 33.3, neither: 0.0}
