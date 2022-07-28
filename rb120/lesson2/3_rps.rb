module UserInterface
  LINE_DIVIDER = "--------------------------------------------------"

  def display_line
    puts LINE_DIVIDER
  end

  def game_name
    Move::VALUES.map(&:capitalize).join(', ')
  end

  def valid_moves
    Move::VALUES[0..-2].map(&:downcase).join(', ') + \
      " or " + Move::VALUES[-1].downcase
  end
end

class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

  WINNING_MOVES = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'spock' => ['rock', 'scissors'],
    'lizard' => ['paper', 'spock']
  }

  def initialize(value)
    @value = value
  end

  def >(other_move)
    WINNING_MOVES[@value].include?(other_move.value)
  end

  def <(other_move)
    WINNING_MOVES[other_move.value].include?(@value)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  @@move_history = {}

  def initialize
    @move = nil
    @score = 0
    set_name
    @@move_history[name] = []
  end

  def choose
    @@move_history[name] << move.value
  end

  def self.move_history
    @@move_history
  end
end

class Human < Player
  include UserInterface

  def set_name
    n = ""
    loop do
      print "What's your name? "
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must provide a name."
    end
    self.name = n
  end

  def choose
    display_line

    choice = nil

    loop do
      print "Please choose #{valid_moves}: "
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, you've made an invalid choice."
    end

    self.move = Move.new(choice)
    super
  end
end

class Computer < Player
  attr_reader :bot, :hint

  def initialize
    @bot = [Hal.new, R2D2.new, Skynet.new, Glados.new].sample
    @hint = bot.hint
    super
  end

  def set_name
    self.name = bot.name
  end

  def choose
    self.move = bot.move
    super
  end
end

class Hal < Computer
  def initialize
    @name = 'Hal 9000'
    @hint = "he's as dumb as a rock!" # Hal always picks 'rock'
  end

  def move
    Move.new('rock')
  end
end

class R2D2 < Computer
  def initialize
    @name = 'R2D2'
    @hint = "he's completely unpredictable!" # It picks a move at random
  end

  def move
    Move.new(Move::VALUES.sample)
  end
end

class Glados < Computer
  def initialize
    @name = 'GLaDOS'
    @hint = "she's watching your last move closely!" # She copies your last move
  end

  def move
    human_move_history = Player.move_history.to_a[0][1]
    if human_move_history.size == 1
      Move.new(Move::VALUES.sample)
    else
      Move.new(human_move_history[-2])
    end
  end
end

class Skynet < Computer
  def initialize
    @name = 'Skynet'
    @hint = "he's unbeatable..." # Finds the winning move based on human's move
  end

  def move
    human_move_history = Player.move_history.to_a[0][1]
    Move::VALUES.each do |value|
      if Move.new(value) > Move.new(human_move_history[-1])
        return Move.new(value)
      end
    end
  end
end

# Game Orchestration Engine
class RPSGame
  include UserInterface

  attr_accessor :human, :computer

  WINNING_ROUNDS = 3

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Hey #{human.name}! Welcome to #{game_name}!"
    puts "You are playing against #{computer.name} today." \
      " Hint: #{computer.hint}"
    puts "First to #{WINNING_ROUNDS} wins!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def find_winner
    return human if human.move > computer.move
    return computer if human.move < computer.move
    false
  end

  def display_scores
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def display_winner
    if find_winner
      find_winner.score += 1
      puts "#{find_winner.name} won!"
    else
      puts "It's a tie!"
    end

    display_scores
  end

  def update_scores(player)
    player.score += 1
  end

  def find_overall_winner
    return human.name if human.score >= WINNING_ROUNDS
    return computer.name if computer.score >= WINNING_ROUNDS
    false
  end

  def display_overall_winner
    display_line
    puts "#{find_overall_winner} is the overall winner!"
  end

  def play_again?
    answer = nil

    loop do
      print "Would you like to play again (y/n)? "
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Please type 'y' or 'n'."
    end

    answer.downcase == 'y'
  end

  def display_move_history(player)
    puts "#{player.name} made these moves: "\
    "#{Player.move_history[player.name].join(', ')}"
  end

  def display_goodbye_message
    display_overall_winner if find_overall_winner
    display_move_history(human)
    display_move_history(computer)
    puts "Thanks for playing #{game_name}. Good bye!"
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break if find_overall_winner || !play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
