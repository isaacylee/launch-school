# Rock Paper Scissors game walk-through
VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNING_MATCHES = {
  "rock" => ["scissors", "lizard"],
  "paper" => ["rock", "spock"],
  "scissors" => ["paper", "lizard"],
  "lizard" => ["paper", "spock"],
  "spock" => ["scissors", "rock"]
}

CHOICES_SHORTCUTS = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

SCORES = {
  player: 0,
  computer: 0
}

def prompt(message)
  puts ">> #{message}"
end

def win?(first, second)
  WINNING_MATCHES[first].include?(second)
end

def score_keeper(player, computer)
  if win?(player, computer)
    SCORES[:player] += 1
  elsif win?(computer, player)
    SCORES[:computer] += 1
  end
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
    CHOICES_SHORTCUTS.each { |k, v| puts "     Enter '#{k}' for '#{v}'" }
    user_choice = gets.chomp.downcase
    user_choice = CHOICES_SHORTCUTS[user_choice]
    break if VALID_CHOICES.include?(user_choice)
    prompt("Not a valid choice!")
  end

  # Computer makes a choice
  computer_choice = VALID_CHOICES.sample

  # Winner is displayed
  prompt("You chose #{user_choice}; Computer chose #{computer_choice}")

  display_result(user_choice, computer_choice)
  score_keeper(user_choice, computer_choice)

  puts "     Player: #{SCORES[:player]} | Computer: #{SCORES[:computer]}"
  break if SCORES[:player] == 5 || SCORES[:computer] == 5
end

if SCORES[:player] == 5
  prompt("Congratulations, you are a winner!")
else
  prompt("Game Over!")
end

# Can extract messages to a yamlfile still.