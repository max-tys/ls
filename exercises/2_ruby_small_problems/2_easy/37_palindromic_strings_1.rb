# Original solution
# Or simply use String#reverse.
=begin
def palindrome?(string)
  char_array = string.chars
  index = 0
  while index < string.length / 2
    if char_array[index] != char_array[string.length - index - 1]
      return false
    else
      index += 1
    end
  end
  return true
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
=end

# Further exploration - determine whether an array is palindromic
=begin
def palindrome?(array)
  array == array.reverse
end
=end

# Further exploration - determine whether string/array is palindromic

def palindrome?(object)
  object == object.reverse
end

array = %w(a b c b a)
string = 'abcba'

puts palindrome?(array)
puts palindrome?(string)
