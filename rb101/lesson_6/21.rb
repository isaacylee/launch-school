# CONSTANTS

CARD_SUITS = %w(♠ ♥ ♣ ♦)

CARD_VALUES = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10,
  'A' => 11
}

WINNING_NUMBER = 21
DEAL_TO = (WINNING_NUMBER * 0.85).floor

# METHODS

def join(arr, delimiter = '] [')
  case arr.size
  when 0 then ''
  when 1 then "[#{arr.first}]"
  else        "[#{arr.join(delimiter)}]"
  end
end

def display_menu
  puts ""
  puts "♠ ♥ ♣ ♦ ♠ ♥ ♣ ♦ ♠ ♥ ♣ ♦".center(30)
  puts "WELCOME TO TWENTY-ONE!".center(30)
  puts "♠ ♥ ♣ ♦ ♠ ♥ ♣ ♦ ♠ ♥ ♣ ♦".center(30)
  puts ""
  puts "--------MENU--------".center(30)
  puts "  A. START GAME"
  puts "  B. SPECIAL GAME MODE"
  puts "  C. QUIT"
  puts ""
end

def prompt(msg)
  puts ">> #{msg}"
end

def empty_lines
  2.times { puts '' }
end

def shuffle_deck
  dck = []
  CARD_SUITS.each do |suit|
    CARD_VALUES.each do |card, value|
        dck << {card: card, suit: suit, value: value}
    end
  end
  dck.shuffle!
end

def display_string(card)
  "#{card[:card]}#{card[:suit]}"
end

def display_player(hand, total)
  sorted_hand = hand.clone.sort_by! { |card| card[:value] }
  display_strings = sorted_hand.map { |card| display_string(card) }
  puts "You have:   #{join(display_strings)}  =>  #{total}"
end

def reveal_dealer(hand, total)
  display_strings = hand.map { |card| display_string(card) }
  puts "Dealer has: #{join(display_strings)}  =>  #{total}"
end

def display_dealer(hand)
  puts "Dealer has: [#{display_string(hand[0])}] [?]"
end

def cards_total(hand)
  value = hand.map { |card| card[:value] }.sum
  if hand.any? { |card| card[:card] == 'A' }
    hand.map { |card| card[:card] }.count('A').times do
      value -= 10 if value > WINNING_NUMBER
    end
  end
  value
end

def busted?(total)
  total > WINNING_NUMBER
end

def blackjack?(total)
  total == WINNING_NUMBER
end

def player_won?(player_total, dealer_total)
  busted?(dealer_total) || !busted?(player_total) && player_total > dealer_total
end

def tie?(player_total, dealer_total)
  player_total == dealer_total
end

# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
def round_outcome(player_hand, p_status, player_total, dealer_total)
  if p_status.nil?
    prompt("Dealer has dealt cards.")
  elsif p_status == '1' && !busted?(player_total)
    new_card = player_hand.last
    prompt("You drew: [#{display_string(new_card)}].")
  elsif busted?(player_total)
    prompt('Bust! You lose!')
  elsif blackjack?(player_total)
    prompt('Blackjack! You win!')
  elsif player_won?(player_total, dealer_total)
    prompt('You win!')
  elsif tie?(player_total, dealer_total)
    prompt("It's a tie!")
  else
    prompt('Dealer wins!')
  end
end

def score_keeper(player_total, dealer_total, scores)
  if player_won?(player_total, dealer_total) || blackjack?(player_total)
    scores[:player] += 1
  elsif !tie?(player_total, dealer_total)
    scores[:dealer] += 1
  end
end
# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

def game_outcome(scores)
  if scores[:player] == 5
    puts "YOU WON!!".center(30)
  else
    puts "DEALER WON..".center(30)
  end
end

def display_scores(scores)
  system 'clear'
  puts "  Player: #{scores[:player]}  |  Dealer: #{scores[:dealer]}".center(30)
  empty_lines
end

def display_table(player_hand, dealer_hand, player_total)
  display_dealer(dealer_hand)
  display_player(player_hand, player_total)
  empty_lines
end

def reveal_table(player_hand, dealer_hand, player_total, dealer_total)
  reveal_dealer(dealer_hand, dealer_total)
  display_player(player_hand, player_total)
  empty_lines
end

def display_gameover(scores)
  system 'clear'
  display_scores(scores)
  puts "GAME     ".center(30)
  puts "     OVER".center(30)
  empty_lines
  game_outcome(scores)
  empty_lines
end

def play_again?
  answer = nil
  loop do
    prompt('Play again? (Y/N)')
    answer = gets.chomp.downcase
    break if ['y', 'n'].include?(answer)
    prompt('Invalid input.')
  end
  answer.start_with?('y')
end

# GAME LOGIC
loop do
  system 'clear'
  display_menu
  print "  SELECT: "
  choice = nil

  loop do
    choice = gets.chomp.downcase
    break if ['a', 'b', 'c'].include?(choice)
    prompt("Error! Invalid input.")
    print "  SELECT: "
  end

  case choice
  when 'b'
    puts ''
    print ">> Choose the winning number (greater than 21): "
    special_num = nil
    loop do
      special_num = gets.chomp
      break if special_num.to_i.to_s == special_num && special_num.to_i > 21
      prompt("Error! Select a number greater than 21.")
    end
    WINNING_NUMBER = special_num.to_i
  when 'c'
    break
  else
    WINNING_NUMBER = 21
  end

  loop do
    scores = { player: 0, dealer: 0 }
    loop do
      deck = shuffle_deck

      player_hand = []
      dealer_hand = []
      p_status = nil

      2.times do
        player_hand << deck.pop
        dealer_hand << deck.pop
      end

      player_total = cards_total(player_hand)
      dealer_total = cards_total(dealer_hand)

      display_scores(scores)
      display_table(player_hand, dealer_hand, player_total)
      round_outcome(player_hand, p_status, player_total, dealer_total)

      loop do
        display_scores(scores)
        display_table(player_hand, dealer_hand, player_total)
        round_outcome(player_hand, p_status, player_total, dealer_total)

        break if busted?(player_total)
        loop do
          prompt("Choose: (1) HIT or (2) STAY")
          p_status = gets.chomp.downcase
          break if ['1', '2'].include?(p_status)
          prompt("Error! Invalid input.")
        end
        break if p_status == '2'
        player_hand << deck.pop
        player_total = cards_total(player_hand)
      end

      if busted?(player_total)
        score_keeper(player_total, dealer_total, scores)

        display_scores(scores)
        reveal_table(player_hand, dealer_hand, player_total, dealer_total)
        round_outcome(player_hand, p_status, player_total, dealer_total)

        break if scores.values.include?(5)

        prompt("Press 'Enter' to continue...")
        continue = gets.chomp
        next if continue
      else
        puts "You chose to stay!"
      end

      until dealer_total >= DEAL_TO || busted?(dealer_total)
        dealer_hand << deck.pop
        dealer_total = cards_total(dealer_hand)
      end

      score_keeper(player_total, dealer_total, scores)
      display_scores(scores)
      reveal_table(player_hand, dealer_hand, player_total, dealer_total)
      round_outcome(player_hand, p_status, player_total, dealer_total)

      break if scores.values.include?(5)

      prompt("Press 'Enter' to continue...")
      continue = gets.chomp
      next if continue
    end
    prompt("Press 'Enter' to continue...")
    continue = gets.chomp
    display_gameover(scores) if continue
    play_again? ? next : break
  end
end
empty_lines
prompt('Thanks for playing!')
