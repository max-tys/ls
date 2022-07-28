def palindromic_number?(integer)
  string = integer.to_s
  string == string.reverse
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
