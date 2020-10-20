require 'pry'
require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
TOTAL_ROUNDS = 3
SCORES = { player: 0, computer: 0 }
current_player = 'P'

def prompt(msg)
  puts "=> #{msg}"
end

def indent
  " " * 15
end

def display_scores
  puts "SCORES [Player : #{SCORES[:player]}] [Computer : #{SCORES[:computer]}]"
end

# rubocop:disable Metrics/MethodLength
def display_board(brd)
  system 'clear'
  prompt "Player is #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  prompt "First player to #{TOTAL_ROUNDS} wins!"
  puts ""
  puts "#{indent}     |     |     "
  puts "#{indent}  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "#{indent}     |     |     "
  puts "#{indent}-----+-----+-----"
  puts "#{indent}     |     |     "
  puts "#{indent}  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "#{indent}     |     |     "
  puts "#{indent}-----+-----+-----"
  puts "#{indent}     |     |     "
  puts "#{indent}  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "#{indent}     |     |     "
  puts ""
end
# rubocop:enable Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter = ', ', word = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def place_piece!(board, current_player)
  current_player == "P" ? player_turn!(board) : computer_turn!(board)
end

def alternate_player(player)
  player == "P" ? "C" : "P"
end

def integer?(num)
  num.to_s == num.to_i.to_s
end

def player_turn!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp
    break if empty_squares(brd).include?(square.to_i) && integer?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square.to_i] = PLAYER_MARKER
end

def neutral_computer_turn!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def computer_turn!(brd)
  if detect_winning_move(brd)
    offensive_computer_turn!(brd)
  elsif detect_close_call(brd)
    defensive_computer_turn!(brd)
  elsif middle_square_open?(brd)
    take_middle_square!(brd)
  else
    neutral_computer_turn!(brd)
  end
end

def defensive_computer_turn!(brd)
  defend_square = []
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      defend_square << brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
    end
  end
  square = defend_square.compact.sample
  brd[square] = COMPUTER_MARKER
end

def offensive_computer_turn!(brd)
  winning_square = []
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      winning_square << brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
    end
  end
  square = winning_square.compact.sample
  brd[square] = COMPUTER_MARKER
end

def take_middle_square!(brd)
  middle_square = 5
  brd[middle_square] = COMPUTER_MARKER
end

def middle_square_open?(brd)
  empty_squares(brd).include?(5)
end

def detect_close_call(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
       brd.values_at(*line).count(COMPUTER_MARKER) == 0
      return true
    end
  end
  nil
end

def detect_winning_move(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2 &&
       brd.values_at(*line).count(PLAYER_MARKER) == 0
      return true
    end
  end
  nil
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do
  board = nil
  loop do
    board = initialize_board

    display_board(board)
    display_scores

    loop do
      prompt "Pick who goes first: Player (P) or Computer (C)"
      answer = gets.chomp.upcase
      if answer == 'P' || answer == 'C'
        current_player = answer
        break
      else
        puts "Invalid choice, pick 'P' or 'C'"
      end
    end

    loop do
      display_board(board)
      display_scores

      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    if detect_winner(board) == 'Player'
      SCORES[:player] += 1
    elsif detect_winner(board) == 'Computer'
      SCORES[:computer] += 1
    end
    break if SCORES.values.include?(TOTAL_ROUNDS)

    display_board(board)
    display_scores
    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end
    prompt "Press 'Enter' to continue."
    answer = gets.chomp
    next if answer
  end

  display_board(board)
  display_scores
  if SCORES[:player] == TOTAL_ROUNDS
    prompt "Player wins!"
  else
    prompt "Computer wins!"
  end

  play_again = ""

  loop do
    prompt "Play again? (y/n)"
    play_again = gets.chomp.downcase
    break if play_again == 'n' || play_again == 'y'
    prompt "Invalid choice, select 'y' or 'n'"
  end

  break if play_again == 'n'

  SCORES[:player] = 0
  SCORES[:computer] = 0
end

prompt "Thanks for playing!"
