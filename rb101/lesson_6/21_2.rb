require 'pry'
require 'pry-byebug'

CARD_SUITS = %w(♠ ♥ ♣ ♦)

CARD_VALUES = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10,
  'A' => 11
}

def join(arr, delimiter = '] [')
  case arr.size
  when 0 then ''
  when 1 then "[#{arr.first}]"
  else        "[#{arr.join(delimiter)}]"
  end
end

def shuffle_deck
  dck = CARD_VALUES.keys.product(CARD_SUITS).map{ |card| card.join }
  dck.shuffle!
end

def prompt(msg)
  puts ">> #{msg}"
end

def empty_lines
  puts ''
  puts ''
end

def display_player(hand, total)
  sorted_hand = hand.clone
  sorted_hand.sort_by! { |card| CARD_VALUES[card[0..card.size-2]] }
  puts "You have:   #{join(sorted_hand)}  =>  #{total}"
end

def reveal_dealer(hand, total)
  puts "Dealer has: #{join(hand)}  =>  #{total}"
end

def display_dealer(hand)
  puts "Dealer has: [#{hand[0]}] [?]"
end

def cards_total(hand)
  value = hand.map { |card| CARD_VALUES[card[0..card.size-2]] }.reduce(0, :+)
  if hand.map{ |card| card[0] }.include?('A')
    hand.map { |card| card[0] }.count('A').times do
      value -= 10 if value > 21
    end
  end
  value 
end

def busted?(total)
  total > 21 
end

def round_outcome(p_hand, p_status, p_total, d_total, scores)
  case
  when p_status == nil
    prompt("Dealer has dealt cards.")
  when p_status == '1' && !busted?(p_total)
    prompt("You drew: [#{p_hand.last}].")
  when busted?(p_total)
    prompt('Bust! You lose!')
  when p_total == 21
    prompt('Blackjack! You win!')
  when busted?(d_total) || p_total > d_total
    prompt('You win!')
  when p_total == d_total
    prompt("It's a tie!")
  else
    prompt('Dealer wins!')
  end
end

def score_keeper(p_total, d_total, scores)
  case
  when busted?(p_total) || !busted?(p_total) && !busted?(d_total) && d_total > p_total
    scores[:dealer] += 1
  when p_total == 21 || busted?(d_total) || p_total > d_total
    scores[:player] += 1
  else
  end
end

def game_outcome(scores)
  if scores[:player] == 5
    puts "YOU WON!!".center(27)
  else
    puts "DEALER WON..".center(27)
  end
end

def display_scores(scores)
  puts "  Player: #{scores[:player]}  |  Dealer: #{scores[:dealer]}".center(27)
end

def display_screen(p_hand, d_hand, p_status, p_total, d_total, scores)
  system 'clear'
  display_scores(scores)
  empty_lines
  display_dealer(d_hand)
  display_player(p_hand, p_total)
  empty_lines
  round_outcome(p_hand, p_status, p_total, d_total, scores)
end

def round_display_screen(p_hand, d_hand, p_status, p_total, d_total, scores)
  system 'clear'
  display_scores(scores)
  empty_lines
  reveal_dealer(d_hand, d_total)
  display_player(p_hand, p_total)
  empty_lines
  round_outcome(p_hand, p_status, p_total, d_total, scores)
end

def game_display_screen(scores)
  system 'clear'
  display_scores(scores)
  empty_lines
  puts "GAME    ".center(26)
  puts "    OVER".center(26)
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
  
loop do
  scores = {player: 0, dealer: 0}
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

    display_screen(p_hand, d_hand, p_status, p_total, d_total, scores)

    loop do
      display_screen(p_hand, d_hand, p_status, p_total, d_total, scores)
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
      round_display_screen(p_hand, d_hand, p_status, p_total, d_total, scores)
      break if scores.values.include?(5)

      prompt("Press 'Enter' to continue...")
      continue = gets.chomp
      next if continue
    else
      puts "You chose to stay!"
    end

    until d_total >= 17 || busted?(d_total)
      d_hand << deck.pop
      d_total = cards_total(d_hand)
    end

    score_keeper(p_total, d_total, scores)
    round_display_screen(p_hand, d_hand, p_status, p_total, d_total, scores)

    break if scores.values.include?(5)

    prompt("Press 'Enter' to continue...")
    continue = gets.chomp
    next if continue
    
  end
  game_display_screen(scores)
  play_again? ? next : break
end

prompt('Thanks for playing!')

