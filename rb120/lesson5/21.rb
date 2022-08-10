require 'pry'
require 'io/console'

# Totals up the points of a set of cards held by a Participant or a Deck object.
module Countable
  # Returns the most advantageous number of points for a Blackjack game
  def points
    ranks = cards_to_ranks(cards)
    number_of_aces = ranks.count('A')
    max_points = ranks_to_points(ranks).sum
    adjusted_points = max_points

    loop do
      break if number_of_aces == 0 || adjusted_points <= Game::LIMIT
      adjusted_points -= 10
      number_of_aces -= 1
    end

    adjusted_points
  end

  # Transforms an array of Card objects into an array of rank strings.
  def cards_to_ranks(cards)
    cards.map(&:rank)
  end

  # Transforms an array of rank strings into an array of points
  # The default value of an ace may be overridden
  def ranks_to_points(ranks, ace_default: 11)
    ranks.map do |rank|
      if %w(2 3 4 5 6 7 8 9).include? rank
        rank.to_i
      elsif %w(10 J Q K).include? rank
        10
      else
        ace_default == 11 ? 11 : ace_default
      end
    end
  end

  # Returns the minimum number of points in a hand or deck
  def min_points
    ranks = cards_to_ranks(cards)
    ranks_to_points(ranks, ace_default: 1).sum
  end
end

# Superclass of Player and Dealer.
class Participant
  include Countable

  attr_reader :cards

  def initialize
    @cards = []
  end

  def show_cards
    cards.map(&:to_s).join(', ')
  end

  def hit(deck)
    cards << deck.deal
  end
end

class Player < Participant
  attr_accessor :move

  def to_s
    "You"
  end

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
  def to_s
    "The dealer"
  end

  def show_one_card
    "#{cards.first} and a concealed card."
  end
end

# Contains an array of 52 shuffled Card objects when initialized.
class Deck
  include Countable

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

# Card objects have a suit and a rank, which is used to determine a card's value
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

# Main game orchestration.
class Game
  LIMIT = 21

  attr_reader :deck, :player, :dealer, :winner

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @winner = { id: nil, condition: nil }
  end

  def start
    show_welcome_message
    deal_cards
    participants_turn unless someone_has_blackjack?
    show_result
    show_goodbye_message
  end

  private

  # Methods relating to the welcome message

  def show_welcome_message
    puts "#{suit_symbols}" \
      " Welcome to Blackjack! " \
      "#{suit_symbols.reverse}"
    puts ""

    puts "Press 'y' to read the rules of Blackjack."
    puts "Press any other key to play Blackjack!"

    input = STDIN.getch
    show_rules if input == 'y'
  end

  def suit_symbols
    Deck::SUITS.join(' ')
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def show_rules
    clear

    bannerize(" Blackjack Rules ", corner: "+", padding: "-", justify: 'center')
    bannerize("Compete with the dealer in this comparing card game!")
    bannerize("- Try to get as close to 21 points as possible.")
    bannerize("- If you go over 21, it's a 'bust' and you lose!")
    bannerize("")

    bannerize("Each card carries a value depending on its rank, as follows:")
    bannerize("- For numbered cards (2-10), the value of the card is its rank.")
    bannerize("- Face cards (Jack, Queen, King) carry the value of 10.")
    bannerize("- The Ace is valued at either 1 or 11.")
    bannerize("")

    bannerize("A hit means you will ask for another card.")
    bannerize("- You can hit as many times as you want.")
    bannerize("- The dealer must hit until he has at least 17 points.")
    bannerize("")
    bannerize("If you choose to stay, you will not receive any more cards.")
    bannerize("You will also end your turn if you stay.")
    bannerize("", corner: "+", padding: "-")

    pause_execution
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def clear
    system 'clear'
  end

  def bannerize(text, corner: '|', padding: ' ', justify: 'left')
    if justify == 'left'
      puts corner + ' ' + text.ljust(77, padding) + corner
    else
      puts corner + text.center(78, padding) + corner
    end
  end

  def pause_execution
    puts "Press any key to continue."
    STDIN.getch
  end

  # The first stage in Blackjack is the dealing of cards.
  def deal_cards
    2.times { player.cards << deck.deal }
    2.times { dealer.cards << deck.deal }
  end

  # The game ends immediately if someone has a blackjack hand.
  def someone_has_blackjack?
    if blackjack_hand?(player.cards)
      @winner = { id: player, condition: 'blackjack' }
    elsif blackjack_hand?(dealer.cards)
      @winner = { id: dealer, condition: 'blackjack' }
    else
      false
    end
  end

  def blackjack_hand?(cards)
    ranks = deck.cards_to_ranks(cards)
    ranks.include?('A') && ranks.any? { |rank| %w(10 J Q K).include? rank }
  end

  # The second stage in Blackjack involves hitting and staying.
  def participants_turn
    player_turn
    dealer_turn unless busted?(player)
    compare_points unless someone_busted?
  end

  # The player may draw cards until he chooses to stay or has busted the limit.
  def player_turn
    loop do
      clear
      puts "These are the cards on the table."
      show_cards(conceal: 'dealer')
      player_picks_move
      execute_player_move
      break if player.stay? || busted?(player)
    end
  end

  def show_cards(conceal: 'none')
    puts "Your cards: #{player.show_cards}"

    if conceal == 'none'
      puts "Dealer's cards: #{dealer.show_cards}"
    else
      puts "Dealer's cards: #{dealer.show_one_card}"
    end

    puts ""
  end

  def player_picks_move
    show_player_options

    loop do
      print "Your move: "
      player.move = gets.chomp
      break if %w(1 2 3 4).include? player.move

      puts "Invalid input. Please enter '1', '2', '3', or '4'."
    end

    puts ""
  end

  def show_player_options
    puts "It is your turn now. Please select one of the following options:"
    puts "1) Hit and draw a card from the deck."
    puts "2) Stay and end your turn."
    puts "3) Show me the approx. odds of busting if I choose to hit."
    puts "4) Show me the rules of Blackjack."
    puts ""
  end

  def execute_player_move
    clear
    case player.move
    when '1' then player.hit(deck)
    when '2' then player.stay
    when '3' then show_bust_chance
    when '4' then show_rules
    end
  end

  # Display the odds of the player busting with the next hit.
  def show_bust_chance
    puts "The likelihood of you busting is approximately #{bust_chance}%."
    pause_execution
  end

  # Returns the odds of the player busting with the next hit.
  def bust_chance
    safe_points = potential_points.select { |pt| pt <= max_point_under_limit }
    ((1 - safe_points.size.fdiv(potential_points.size)) * 100).round(2)
  end

  # Returns an array of points that are left in the deck*
  # The deck includes the dealer's concealed card.
  def potential_points
    potential_cards = deck.cards + [dealer.cards.last]
    potential_ranks = deck.cards_to_ranks(potential_cards)
    deck.ranks_to_points(potential_ranks, ace_default: 1)
  end

  # Returns the highest value of a card that the player can draw w/o busting.
  # All Aces are valued at 1 point.
  def max_point_under_limit
    LIMIT - player.min_points
  end

  # Records busted hands and returns a truthy or falsey value.
  def busted?(participant)
    return false if participant.points <= LIMIT

    @winner = if participant == player
                { id: dealer, condition: 'other_busted' }
              else
                { id: player, condition: 'other_busted' }
              end
  end

  def someone_busted?
    busted?(player) || busted?(dealer)
  end

  # The dealer draws repeatedly until he has at least 17 points.
  def dealer_turn
    loop do
      break if dealer.points >= 17

      dealer.hit(deck)
    end
  end

  # Compare the player and dealer's points as this is another winning condition
  def compare_points
    if player.points > dealer.points
      @winner = { id: player, condition: 'more_points' }
    elsif player.points < dealer.points
      @winner = { id: dealer, condition: 'more_points' }
    end
  end

  # Outcome of the game is decided by @winner
  def show_result
    clear
    show_cards_and_points
    case winner[:condition]
    when 'blackjack'    then puts "#{winner[:id]} won with a blackjack hand!"
    when 'other_busted' then puts "#{winner[:id]} won by not busting!"
    when 'more_points'  then puts "#{winner[:id]} won with more points!"
    else                     puts "It's a push (tie)!"
    end
  end

  def show_cards_and_points
    show_cards
    puts "You have #{player.points} points."
    puts "The dealer has #{dealer.points} points."
    puts ""
  end

  def show_goodbye_message
    puts "Thanks for playing Blackjack!"
  end
end

Game.new.start
