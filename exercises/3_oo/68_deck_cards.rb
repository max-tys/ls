class Card
  include Comparable

  attr_reader :rank, :suit

  RANK_POINTS = { "2"=>0,"3"=>1, "4"=>2, "5"=>3, "6"=>4, "7"=>5, "8"=>6, "9"=>7,
             "10"=>8, "Jack"=>9, "Queen"=>10, "King"=>11, "Ace"=>12 }

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def rank_value
    RANK_POINTS[rank.to_s]
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

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.