def reverse_words(string)
  array_words = string.split

  # Array#map creates a new array. It does not mutate the caller it seems.
  handled_array = array_words.map do |word|
    word.length >= 5 ? word.reverse : word
  end
  handled_array.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
