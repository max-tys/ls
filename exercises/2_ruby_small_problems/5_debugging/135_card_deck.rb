# We started working on a card game but got stuck.
# Check out why the code below raises a TypeError.

# Once you get the program to run and produce a sum, you might notice that the sum is off:
# It's lower than it should be. Why is that?

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit
# player_cards will contain 4 elements after the each method call.

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = 0

sum = deck.reduce(0) do |total, (_, remaining_cards)|
  total + remaining_cards.map do |card|
    score(card)
  end.sum
end

puts sum

# The code raises a TypeError on line 41.
# This is because we had attempted to pass a symbol as an argument to the Array#sum method call on line 41.
# On line 36, we invoke the `reduce` method on `deck`, which is a hash representing the remaining cards in the deck.
# `reduce` iterates over each key-value pair of `deck`.
# The block parameter `remaining_cards` is assigned to the `cards` array of the respective suits.
# We call the `Array#map` method on `remaining_cards` in a bid to convert each 'card' into its respective value.
# `map` returns a new array that contains 12 elements. Each element in the new array represents the value of the card in the deck.
# `map` does not mutate its caller.
# We did not use the new array.
# `remaining_cards` still references the original array containing both integers and symbols.
# Line 41 is shorthand for `sum = sum + remaining_cards.sum`.
# Array#sum does not allow us to concatenate a symbol with an integer.
# To fix this, we merely need to assign a local variable to the return value of the map method call on line 37
# and use the said variable on line 41.
# The value is lower than expected because all four keys in the `deck` hash reference the same array object, i.e., `cards`.
# On line 31, we mutate the `cards` array and change its value permanently with the Array#pop method.
# This change affects the value for every single key in the `deck` hash.
# We need to create clones of the `cards` array.
