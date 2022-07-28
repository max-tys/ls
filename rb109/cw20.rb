# Write a function toWeirdCase (weirdcase in Ruby)
# that accepts a string,
# and returns the same string with all even indexed characters in each word upper cased,
# and all odd indexed characters in each word lower cased.
# The indexing just explained is zero based, so the zero-ith index is even,
# therefore that character should be upper cased and you need to start over for each word.

# The passed in string will only consist of alphabetical characters and spaces(' ').
# Spaces will only be present if there are multiple words.
# Words will be separated by a single space(' ').

# Examples:
# weirdcase( "String" )#=> returns "StRiNg"
# weirdcase( "Weird string case" );#=> returns "WeIrD StRiNg CaSe"

# Input is a string
  # The string may consist of multiple words
# Output is a transformed string
  # We will transform every 'word' in the string
  # words are delimited by a single space
  # Transformation - odd or even index?
    # Odd index (1 3 5 7 9...) - lowercase
    # Even index (0 2 4 6 8...) - uppercase
  # The index resets each time we encounter a new word.
# Algorithm
  # Split string into its word components
    # "Weird string case" --> ["Weird", "string", "case"] (init a new variable)
  # Iterate through the array and transform each word
    # "Weird" --> "WeIrD"
    # "Weird" --> ['W', 'e', ...'d']
      # Iterate through each character in the array of characters
      # Odd-indexed? --> lowercase
      # Even-indexed? --> uppercase
    # We will store the transformed word in a new array
    # Repeat the iteration for every word in the array
  # Convert array of transformed array of characters --> string of transformed words

def weirdcase(string)
  string.split.map do |word|
    word.chars.map.with_index do |char, idx|
      idx.odd? ? char.downcase : char.upcase
    end.join
  end.join(' ')
end

p weirdcase("This is a test") == "ThIs Is A TeSt"
