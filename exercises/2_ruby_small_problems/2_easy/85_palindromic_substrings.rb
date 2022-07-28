# Write a method that returns a list of all substrings of a string that are palindromic.
# That is, each substring must consist of the same sequence of characters forwards as it does backwards.
# The return value should be arranged in the same sequence as the substrings appear in the string.
# Duplicate palindromes should be included multiple times.

def leading_substrings(string)
  string.chars.each_index.with_object([]) { |index, array| array << string[0..index] }
end

def substrings(string)
  all_substrings = []

  index = 0
  loop do
    all_substrings << leading_substrings(string[index..-1])
    index += 1
    break if index >= string.size
  end

  all_substrings.flatten
end

# Original solution
def palindromes(string)
  substrings(string).select do |substring|
    (substring == substring.reverse) && substring.length > 1
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
