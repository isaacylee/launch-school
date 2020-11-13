# CONSTANTS

CARD_SUITS = %w(♠ ♥ ♣ ♦)

CARD_VALUES = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10,
  'A' => 11
}

WINNING_NUMBER = 21

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
  dck = CARD_VALUES.keys.product(CARD_SUITS).map(&:join)
  dck.shuffle!
end

def display_player(hand, total)
  sorted_hand = hand.clone
  sorted_hand.sort_by! { |card| CARD_VALUES[card[0..card.size - 2]] }
  puts "You have:   #{join(sorted_hand)}  =>  #{total}"
end

def reveal_dealer(hand, total)
  puts "Dealer has: #{join(hand)}  =>  #{total}"
end

def display_dealer(hand)
  puts "Dealer has: [#{hand[0]}] [?]"
end

def cards_total(hand)
  value = hand.map { |card| CARD_VALUES[card[0..card.size - 2]] }.reduce(0, :+)
  if hand.map { |card| card[0] }.include?('A')
    hand.map { |card| card[0] }.count('A').times do
      value -= 10 if value > WINNING_NUMBER
    end
  end
  value
end

def busted?(total)
  total > WINNING_NUMBER
end

# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
def round_outcome(p_hand, p_status, p_total, d_total)
  if p_status.nil?
    prompt("Dealer has dealt cards.")
  elsif p_status == '1' && !busted?(p_total)
    prompt("You drew: [#{p_hand.last}].")
  elsif busted?(p_total)
    prompt('Bust! You lose!')
  elsif p_total == WINNING_NUMBER
    prompt('Blackjack! You win!')
  elsif busted?(d_total) || p_total > d_total
    prompt('You win!')
  elsif p_total == d_total
    prompt("It's a tie!")
  else
    prompt('Dealer wins!')
  end
end

def score_keeper(p_total, d_total, scores)
  if busted?(p_total)
    scores[:dealer] += 1
  elsif !busted?(p_total) && !busted?(d_total) && d_total > p_total
    scores[:dealer] += 1
  elsif p_total == WINNING_NUMBER || busted?(d_total) || p_total > d_total
    scores[:player] += 1
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

def display_table(p_hand, d_hand, p_total)
  display_dealer(d_hand)
  display_player(p_hand, p_total)
  empty_lines
end

def reveal_table(p_hand, d_hand, p_total, d_total)
  reveal_dealer(d_hand, d_total)
  display_player(p_hand, p_total)
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

      p_hand = []
      d_hand = []
      p_status = nil

      2.times do
        p_hand << deck.pop
        d_hand << deck.pop
      end

      p_total = cards_total(p_hand)
      d_total = cards_total(d_hand)

      display_scores(scores)
      display_table(p_hand, d_hand, p_total)
      round_outcome(p_hand, p_status, p_total, d_total)

      loop do
        display_scores(scores)
        display_table(p_hand, d_hand, p_total)
        round_outcome(p_hand, p_status, p_total, d_total)

        break if busted?(p_total)
        loop do
          prompt("Choose: (1) HIT or (2) STAY")
          p_status = gets.chomp.downcase
          break if ['1', '2'].include?(p_status)
          prompt("Error! Invalid input.")
        end
        break if p_status == '2'
        p_hand << deck.pop
        p_total = cards_total(p_hand)
      end

      if busted?(p_total)
        score_keeper(p_total, d_total, scores)

        display_scores(scores)
        reveal_table(p_hand, d_hand, p_total, d_total)
        round_outcome(p_hand, p_status, p_total, d_total)

        break if scores.values.include?(5)

        prompt("Press 'Enter' to continue...")
        continue = gets.chomp
        next if continue
      else
        puts "You chose to stay!"
      end

      until d_total >= (WINNING_NUMBER * 0.85).floor || busted?(d_total)
        d_hand << deck.pop
        d_total = cards_total(d_hand)
      end

      score_keeper(p_total, d_total, scores)
      display_scores(scores)
      reveal_table(p_hand, d_hand, p_total, d_total)
      round_outcome(p_hand, p_status, p_total, d_total)

      break if scores.values.include?(5)

      prompt("Press 'Enter' to continue...")
      continue = gets.chomp
      next if continue
    end
    prompt("Press 'Enter' to continue...")
    continue = gets.chomp
    display_gameover(scores)
    play_again? ? next : break
  end
end
empty_lines
prompt('Thanks for playing!')
