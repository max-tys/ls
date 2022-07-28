# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument with the first character of
# every word capitalized and all other letters lowercase.
# You may assume that words are any sequence of non-blank characters.

# Original solution
# def word_cap(string)
#   cap_array = []

#   string.split.each do |word|
#     cap_array << word.capitalize
#   end

#   cap_array.join(' ')
# end

# Further exploration - implementation without capitalize (v1)

# def word_cap(string)
#   cap_array = string.split.map do |word|
#     word[0].upcase + word[1..-1].downcase
#   end
#   cap_array.join(' ')
# end

# Further exploration - implementation without capitalize and up/downcase (v2)

def change_case(string, option)
  up_chars = ('A'..'Z').to_a
  down_chars = ('a'..'z').to_a

  new_string = string.chars.map do |char|
                 case option
                 when 'up'
                   if down_chars.include?(char)
                     up_chars[down_chars.index(char)]
                   else
                     char
                   end
                 when 'down'
                   if up_chars.include?(char)
                     down_chars[up_chars.index(char)]
                   else
                     char
                   end
                 end
               end

  new_string.join
end

def word_cap(string)
  cap_array = string.split.map do |word|
    change_case(word[0], 'up') + change_case(word[1..-1], 'down')
  end
  cap_array.join(' ')

end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
