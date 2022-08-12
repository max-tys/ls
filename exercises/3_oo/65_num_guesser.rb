class GuessingGame
  def initialize(min, max)
    @range = min..max
    @number_of_guesses = Math.log2(range.size).to_i + 1
    @secret_number = range.to_a.sample
  end

  def play
    loop do
      ask_player_to_guess

      player_makes_a_guess
      break if correct_guess?

      display_hint
      break if out_of_guesses?
    end

    display_outcome
  end

  private

  attr_reader :range, :number_of_guesses, :guess, :secret_number

  def ask_player_to_guess
    display_remaining_guesses
    print "Enter a number between #{range.first} and #{range.last}: "
  end

  def display_remaining_guesses
    if number_of_guesses > 1
      puts "You have #{number_of_guesses} guesses remaining."
    else
      puts 'You have 1 guess remaining.'
    end
  end

  def player_makes_a_guess
    loop do
      @guess = gets.chomp.to_i
      break if range.cover?(guess)

      print 'Invalid guess. '\
        "Enter a number between #{range.first} and #{range.last}: "
    end

    deduct_lives
  end

  def deduct_lives
    @number_of_guesses -= 1
  end

  def correct_guess?
    guess == secret_number
  end

  def display_hint
    if guess > secret_number
      puts 'Your guess is too high.'
    elsif guess < secret_number
      puts 'Your guess is too low.'
    end
    puts ''
  end

  def out_of_guesses?
    number_of_guesses.zero?
  end

  def display_outcome
    if correct_guess?
      puts "That's the number!"
      puts ''
      puts 'You won!'
    else
      puts 'You have no more guesses. You lost!'
    end
  end
end

game = GuessingGame.new(1, 10)
game.play