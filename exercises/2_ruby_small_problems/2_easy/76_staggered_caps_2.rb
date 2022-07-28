# Write a method that takes a String as an argument,
# and returns a new String that contains the original value
# using a staggered capitalization scheme in which every other character is capitalized,
# and the remaining characters are lowercase.
# Characters that are not letters should not be changed,
# but count as characters when switching between upper and lowercase.

def staggered_case(string, count_only_alpha = true)
  output_string = ''

  index = 0
  string.chars.each do |char|
    if (char.match(/[A-Za-z]/) || count_only_alpha == false) && index.even?
      index += 1
      output_string += char.upcase
    elsif (char.match(/[A-Za-z]/) || count_only_alpha == false) && index.odd?
      index += 1
      output_string += char.downcase
    else
      output_string += char
      # We do not increment index if we are only counting alphabetic chars.
    end
  end

  output_string
end

# Method will count non-alphabetic characters if a second argument, false, is given.
p staggered_case('I Love Launch School!', false) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', false) == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 NuMbErS'

# Method ignores non-alphabetic characters by default
p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
