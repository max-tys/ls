# A friend of yours wrote a number guessing game.
# The first version he shows you picks a random number between 1 and a provided maximum number
# and offers you a given number of attempts to guess it.

# However, when you try it, you notice that it's not working as expected.
# Run the code and observe its behavior. Can you figure out what is wrong?

def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print "Make a guess (1 to #{max_number}): "
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      return
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

      # Try again:
      # guess_number(max_number, max_attempts)
    end
  end
  puts "You're out of tries. The winning number was #{winning_number}."
end

guess_number(10, 3)

# The code does not work as expected because we call `guess_number` each time we make a wrong guess.
# In each new instance of `guess_number`, `winning_number` and `attempts` is reset.
# We should remove the code on line 36.
# We can rely on our loop to continue prompting the user until they have either guessed correctly or run out of guesses.
