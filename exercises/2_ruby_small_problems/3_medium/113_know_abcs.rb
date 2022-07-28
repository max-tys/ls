# Convert list of pairs from ls to nested array

# pairs = "B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M"

# pairs = pairs.split

# pairs.map! do |pair|
#   [pair[0], pair[2]]
# end

def block_word?(word)
  pairs = [["B", "O"], ["X", "K"], ["D", "Q"], ["C", "P"], ["N", "A"],
         ["G", "T"], ["R", "E"], ["F", "S"], ["J", "W"], ["H", "U"],
         ["V", "I"], ["L", "Y"], ["Z", "M"]]

  used_pairs = []

  word.upcase.chars.each do |char|
    pairs.each { |pair| used_pairs << pair if pair.include?(char) }
  end

  ! used_pairs.uniq!
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
