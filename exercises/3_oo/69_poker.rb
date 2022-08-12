require 'pry'

class Card
  include Comparable

  attr_reader :rank, :suit

  RANK_POINTS = { "Jack"=>11, "Queen"=>12, "King"=>13, "Ace"=>14 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def rank_value
    RANK_POINTS.fetch(rank, rank)
  end

  def <=>(other_card)
    rank_value <=> other_card.rank_value
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @deck.empty?
    @deck.pop
  end

  private

  def reset
    @deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @deck << Card.new(rank, suit)
      end
    end

    @deck.shuffle!
  end
end

class PokerHand
  attr_reader :hand

  def initialize(deck)
    @hand = []
    5.times { hand << deck.draw }
  end

  def print
    puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  # A, K, Q, J, and 10 in the same suit
  def royal_flush?
    royal_members = [10] + %w(Jack Queen King Ace)

    hand_ranks == royal_members && flush?
  end

  # Five cards of the same suit in sequence
  def straight_flush?
    straight? && flush?
  end

  # Four cards of the same rank and any one other card
  def four_of_a_kind?
    rank_frequency.count(4) == 1
  end

  # Three cards of one rank and two of another
  def full_house?
    three_of_a_kind? && pair?
  end

  # Five cards of the same suit
  def flush?
    hand.map(&:suit).uniq.size == 1
  end

  # Five cards in sequence
  def straight?
    last_index = hand.size - 1
    values = hand_rank_values

    values.each_index do |idx|
      break if idx == last_index

      return false unless values[idx] + 1 == values[idx + 1]
    end

    true
  end

  # Three cards of the same rank
  def three_of_a_kind?
    rank_frequency.count(3) == 1
  end

  # Two cards of one rank and two cards of another
  def two_pair?
    rank_frequency.count(2) == 2
  end

  # Two cards of the same rank
  def pair?
    rank_frequency.count(2) == 1
  end

  ## Accessorial helper methods to evaluate hands ##

  # Returns an array of ranks
  def hand_ranks
    hand.sort_by(&:rank_value).map(&:rank)
  end

  # Returns an array of rank values
  def hand_rank_values
    hand.map(&:rank_value).sort
  end

  # Returns an array that represents the distribution frequency of the ranks
  def rank_frequency
    hand_ranks.tally.values
  end
end

class Array
  alias_method :draw, :pop
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Test that we can identify each PokerHand type.

hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
