class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def [](key)
    @squares[key]
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.select { |_, sq| sq.unmarked? }.keys
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won_game?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if three_identical_markers?(squares)
    end
    nil
  end

  def find_winning_square(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      markers = get_markers(squares)

      if two_identical_markers?(squares) && markers.include?(marker)
        unmarked_square = squares.select(&:unmarked?).first
        return @squares.key(unmarked_square)
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts '     |     |'
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts '     |     |'
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = get_markers(squares)
    (markers.size == 3) && (markers.min == markers.max)
  end

  def two_identical_markers?(squares)
    markers = get_markers(squares)
    (markers.size) == 2 && (markers.first == markers.last)
  end

  def get_markers(squares)
    squares.select(&:marked?).map(&:marker)
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :marker, :name, :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

class TTTGame
  @@human_marker = nil
  COMPUTER_MARKER = 'O'
  MATCH_POINT = 3

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(@@human_marker)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def play
    clear
    display_welcome_message
    pick_names
    pick_human_marker
    main_game
    display_goodbye_message
  end

  private

  def clear
    system 'clear'
  end

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts "First player to #{MATCH_POINT} wins the match!"
    puts ''
  end

  def pick_names
    print "What is your name? "
    @human.name = gets.chomp
    print "What is your opponent's name? "
    @computer.name = gets.chomp + "OS"
  end

  def pick_human_marker
    print "Which board marker would you like to use? "
    loop do
      @@human_marker = gets.chomp
      break if @@human_marker.size == 1 && @@human_marker != COMPUTER_MARKER
      puts "Sorry, you have chosen an invalid marker."\
        "Please select any letter or symbol other than '#{COMPUTER_MARKER}'."
    end
    @human.marker = @@human_marker
  end

  def main_game
    loop do
      who_goes_first?
      display_board
      player_move
      update_score
      display_result
      break if someone_won_match? || !play_again?

      reset
      display_play_again_message
    end
  end

  def who_goes_first?
    puts "Who should go first?"
    puts "1) #{human.name} goes first;"
    puts "2) #{computer.name} goes first; or"
    puts "3) Let #{computer.name} decide!"

    input = seek_user_input_for_marker
    self.current_marker = input

    clear
  end

  def seek_user_input_for_marker
    input = nil
    loop do
      input = gets.chomp.to_i
      break if [1, 2, 3].include?(input)
      puts "Sorry, please type 1, 2 or 3 to determine who should go first."
    end
    input
  end

  def current_marker=(input)
    @current_marker = case input
                      when 1 then @@human_marker
                      when 2 then COMPUTER_MARKER
                      when 3 then [@@human_marker, COMPUTER_MARKER].sample
                      end
  end

  def display_board
    puts "You're a #{human.marker}. #{computer.name} is an #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won_game? || board.full?

      clear_screen_and_display_board if human_turn?
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = @@human_marker
    end
  end

  def human_turn?
    @current_marker == @@human_marker
  end

  def human_moves
    print "Choose a square (#{joinor(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include? square

      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def joinor(keys, delimiter = ', ', last_delimiter = 'or')
    case keys.size
    when 1 then keys.first
    when 2 then keys.join(" #{last_delimiter} ")
    else        "#{keys[0..-2].join(delimiter)} #{last_delimiter} #{keys.last}"
    end
  end

  def computer_moves
    move = if board.find_winning_square(COMPUTER_MARKER)
             board.find_winning_square(COMPUTER_MARKER)
           elsif board.find_winning_square(@@human_marker)
             board.find_winning_square(@@human_marker)
           elsif board[5].unmarked?
             5
           else
             board.unmarked_keys.sample
           end

    board[move] = computer.marker
  end

  def update_score
    case board.winning_marker
    when @@human_marker   then @human.score += 1
    when COMPUTER_MARKER  then @computer.score += 1
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when @@human_marker   then puts "#{human.name} won!"
    when COMPUTER_MARKER  then puts "#{computer.name} won!"
    else                       puts "It's a tie!"
    end

    display_score
  end

  def display_score
    puts '+-------- Scoreboard --------+'
    puts "|" + "#{human.name}: #{@human.score}".center(28) + "|"
    puts "|" + "#{computer.name}: #{@computer.score}".center(28) + "|"
    puts '+----------------------------+'
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def someone_won_match?
    @human.score >= MATCH_POINT ||
      @computer.score >= MATCH_POINT
  end

  def play_again?
    answer = nil

    loop do
      print 'Would you like to play again (y/n)? '
      answer = gets.chomp.downcase
      break if %w(y n).include? answer

      puts 'Sorry, must be y or n'
    end

    answer == 'y'
  end

  def reset
    board.reset
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe, #{human.name}. Goodbye!"
  end
end

TTTGame.new.play
