# Write a method that takes a String as an argument,
# and returns a new String that contains the original value
# using a staggered capitalization scheme in which every other character is capitalized,
# and the remaining characters are lowercase.
# Characters that are not letters should not be changed,
# but count as characters when switching between upper and lowercase.

def staggered_case(string, option)
  output_array = []

  string.chars.each_with_index do |char, index|
    if (option == 'up' && index.even?) || (option == 'down' && index.odd?)
      output_array << char.upcase
    else
      output_array << char.downcase
    end
  end

  output_array.join
end

p staggered_case('I Love Launch School!', 'up') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', 'up') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', 'up') == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case('ignore 77 the 444 numbers', 'down') == 'iGnOrE 77 tHe 444 nUmBeRs'
