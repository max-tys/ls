class Participant
  attr_reader :cards, :move, :score

  def initialize
    @cards = []
    @move = nil
  end

  def show_cards
    @cards.map(&:to_s).join(', ')
  end

  def busted?
    total
    @score > 21
  end

  def total
    @score = 0
    cards.map(&:rank).each do |rank|
      if %w(2 3 4 5 6 7 8 9).include? rank
        @score += rank.to_i
      elsif %w(10 J Q K).include? rank
        @score += 10
      else
        @score += 1
      end
    end
  end

  def hit(deck)
    cards << deck.deal
  end
end

class Player < Participant
  attr_writer :move

  def hit(deck)
    super(deck)
    puts "You asked for another card."
  end

  def stay
    @stay = true
    puts "You chose to stay."
  end

  def stay?
    @stay
  end
end

class Dealer < Participant
  def show_initial_cards
    "#{@cards.first} and a concealed card."
  end
end

class Deck
  SUITS = %w(♠ ♥ ♦ ♣)
  RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  attr_reader :cards

  def initialize
    @cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
    @cards.shuffle!
  end

  def deal
    @cards.pop
  end
end

class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    rank + suit
  end
end

class Game
  LIMIT = 21

  attr_reader :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    display_welcome_message
    deal_cards
    player_turn
    dealer_turn if !player.busted?
    count_scores
    show_result
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "#{Deck::SUITS.join(' ')}" \
      " Welcome to Blackjack! " \
      "#{Deck::SUITS.reverse.join(' ')}"
    puts ""
  end

  def deal_cards
    puts "Both you and the dealer are dealt two cards each."
    player.cards << deck.deal << deck.deal
    dealer.cards << deck.deal << deck.deal
  end

  def show_all_cards
    puts "Player's cards: #{player.show_cards}"
    puts "Dealer's cards: #{dealer.show_cards}"
    puts ""
  end

  def show_initial_cards
    puts "Player's cards: #{player.show_cards}"
    puts "Dealer's cards: #{dealer.show_initial_cards}"
    puts ""
  end

  def player_turn
    loop do
      show_initial_cards
      player_picks_move
      execute_player_move
      break if player.stay? || player.busted?
    end
  end

  def player_picks_move
    print "Enter '1' to hit, '2' to stay, or '3' for the rules of Blackjack: "
    loop do
      player.move = gets.chomp
      break if %w(1 2 3).include? player.move

      puts "Invalid input. Please enter '1', '2', or '3'."
    end
    puts ""
  end

  def execute_player_move
    clear
    case player.move
    when '1' then player.hit(deck)
    when '2' then player.stay
    when '3' then display_rules
    end
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/LineLength
  def display_rules
    clear

    puts bannerize("Blackjack Rules", "+", "-")
    puts bannerize("Blackjack is a comparing card game where you compete with the dealer.")
    puts bannerize("Try to get as close to 21 points as possible.")
    puts bannerize("If you go over 21, it's a 'bust' and you lose!")
    puts bannerize("")

    puts bannerize("A hit means you will ask for another card.")
    puts bannerize("You can hit as many times as you want.")
    puts bannerize("If you choose to stay, you will not receive any more cards.")
    puts bannerize("You will also end your turn if you stay.")
    puts bannerize("", "+", "-")
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/LineLength

  def bannerize(text, corner = '|', padding = ' ')
    corner + text.center(78, padding) + corner
  end

  def dealer_turn
    loop do
      dealer.total
      break if dealer.score >= 17

      dealer.hit(deck)
    end
  end

  def clear
    system 'clear'
  end

  def count_scores
    player.total
    dealer.total
  end

  # too many lines, and abc size is too high
  def show_result
    clear
    show_all_cards
    puts "You have #{player.score} points."
    puts "The dealer has #{dealer.score} points."
    puts ""
    if player.busted?
      puts "You have busted!"
    elsif dealer.busted?
      puts "The dealer has busted! You win!"
    elsif player.score > dealer.score
      puts "You win!"
    elsif player.score < dealer.score
      puts "You lose!"
    else
      puts "It's a tie!"
    end
  end

  def display_goodbye_message
    puts "Thanks for playing Blackjack!"
  end
end

Game.new.start
