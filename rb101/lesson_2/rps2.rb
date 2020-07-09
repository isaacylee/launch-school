# Rock Paper Scissors game walk-through
VALID_CHOICES = %w(rock paper scissors)
TIE = "It's a tie!"
WIN = "You win!"
LOSE = "You lose!"

def prompt(message)
  puts ">> #{message}"
end

def display_result(player, computer)
  case player
  when "rock"
    case computer
    when "rock" then prompt(TIE)
    when "paper" then prompt(LOSE)
    when "scissors" then prompt(WIN)
    end
  when "paper"
    case computer
    when "rock" then prompt(WIN)
    when "paper" then prompt(TIE)
    when "scissors" then prompt(LOSE)
    end
  when "scissors"
    case computer
    when "rock" then prompt(LOSE)
    when "paper" then prompt(WIN)
    when "scissors" then prompt(TIE)
    end
  end
end

# User makes a choice
loop do
  user_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    user_choice = gets.chomp.downcase
    break if VALID_CHOICES.include?(user_choice)
    prompt("Not a valid choice!")
  end

  # Computer makes a choice
  computer_choice = %w(rock paper scissors).sample

  # Winner is displayed
  puts "You chose #{user_choice}; Computer chose: #{computer_choice}"

  display_result(user_choice, computer_choice)

  prompt("Play again?")
  play_again = gets.chomp.downcase
  break unless play_again.start_with?('y')
end

prompt("Thanks for playing!")