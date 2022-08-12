# Update this class so you can use it
# to determine the lowest ranking and highest ranking cards
# in an Array of Card objects:

class Card
  include Comparable

  attr_reader :rank, :suit

  RANK_VALUES = { "2"=>0,"3"=>1, "4"=>2, "5"=>3, "6"=>4, "7"=>5, "8"=>6, "9"=>7,
             "10"=>8, "Jack"=>9, "Queen"=>10, "King"=>11, "Ace"=>12 }

  SUITS_VALUES = { "Spades"=>4, "Hearts"=>3, "Clubs"=>2, "Diamonds"=>1 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def rank_value
    RANK_VALUES[rank.to_s]
  end

  def suit_value
    SUITS_VALUES[suit]
  end

  def <=>(other_card)
    if rank_value == other_card.rank_value
      suit_value <=> other_card.suit_value
    else
      rank_value <=> other_card.rank_value
    end
  end
end

cards = [Card.new(2, 'Hearts'),
        Card.new(10, 'Diamonds'),
        Card.new('Ace', 'Clubs')]
# puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
        Card.new(4, 'Diamonds'),
        Card.new(10, 'Clubs')]
puts cards.min == Card.new(4, 'Diamonds')
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
        Card.new('Jack', 'Diamonds'),
        Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max == Card.new('Jack', 'Spades')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
        Card.new(8, 'Clubs'),
        Card.new(8, 'Spades')]
puts cards.min == Card.new(8, 'Diamonds')
puts cards.min.rank == 8
puts cards.max == Card.new(8, 'Spades')
puts cards.max.rank == 8
