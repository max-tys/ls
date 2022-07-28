# Given the array...
# Write a program that prints out groups of words that are anagrams.
# Anagrams are words that have the same letters but in a different order.

# Method to determine if two words are anagrams.
def anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

# Generally, we will compare each word in the array with every other word.
# in the array and see if they are anagrams.
# This is done with a two-layer nested loop.
# If a given pair of words is an anagram, they will be added to a hash.
# The key of the hash will be the first word. The value will be the second word.
# If the key exists, subsequent anagrams will be added to the value array.
# Any word that has been added to the hash will not be iterated over again.
# The hash will be converted to a two-layer nested array.

def group_anagrams(array)
  groups = array.each_index.with_object(Hash.new([])) do |i, hsh|
    next if array[i].empty?

    ((i + 1)..(array.size - 1)).each do |j|
      if anagram?(array[i], array[j])
        hsh[array[i]] += [array[j]]
        array[j] = ''
      end
    end
  end

  groups.to_a.map do |lead, members|
    members.prepend(lead).flatten
  end.each do |group|
    p group
  end
end

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
         'flow', 'neon', 'ghost']

group_anagrams(words)
