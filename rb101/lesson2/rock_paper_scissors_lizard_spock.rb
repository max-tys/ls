VALID_CHOICES = %w[rock paper scissors lizard spock]
VALID_INPUTS = %w[r p sc l sp]
WIN_CONDITION = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['paper', 'spock'],
  'spock' => ['rock', 'scissors']
}

def prompt(message)
  Kernel.puts(">> #{message}")
end

def win?(first, second)
  WIN_CONDITION.any? { |key, value| first == key && value.include?(second) }
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won this round!")
  elsif win?(computer, player)
    prompt("Computer won this round!")
  else
    prompt("It's a tie!")
  end
end

loop do # Loops if player wishes to play another match.
  player_score = 0
  computer_score = 0

  prompt("Welcome to rock paper scissors lizard spock!")
  prompt("First to three wins.")

  loop do # Loops until there is a winner.
    choice = '' # Initialise choice outside the loop to avoid scope issues.

    loop do # Loops until valid input is provided
      prompt("Choose one: #{VALID_CHOICES.join(', ')}.")

      choice = Kernel.gets().chomp().downcase()
      if VALID_INPUTS.include?(choice)
        choice = VALID_CHOICES[VALID_INPUTS.index(choice)]
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample()

    prompt("You chose #{choice}, the computer chose #{computer_choice}.")

    display_results(choice, computer_choice)

    player_score += 1 if win?(choice, computer_choice)
    computer_score += 1 if win?(computer_choice, choice)

    prompt("Player: #{player_score} | Computer: #{computer_score}")

    if player_score == 3
      prompt("You won the match!")
      break
    end

    if computer_score == 3
      prompt("The computer won the match!")
      break
    end
  end

  prompt("Do you want to play again? (Y to replay)")

  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
