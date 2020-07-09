# Rock Paper Scissors game walk-through
VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts ">> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lose!")
  else
    prompt("It's a tie!")
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
