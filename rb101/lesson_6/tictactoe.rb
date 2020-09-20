require 'pry'
require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
TOTAL_ROUNDS = 3
scores = {player: 0, computer: 0}


def prompt(msg)
  puts "=> #{msg}"
end

def indent
  " " * 15
end

# rubocop:disable Metrics/AbcSize
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
# rubocop:enable Metrics/AbcSize


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

def player_turn!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def neutral_computer_turn!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
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

    loop do
      display_board(board)
      puts "SCORES | Player : #{scores[:player]} | Computer : #{scores[:computer]} |"
      player_turn!(board)
      break if someone_won?(board) || board_full?(board)
      computer_turn!(board)
      break if someone_won?(board) || board_full?(board)
    end

    if detect_winner(board) == 'Player'
      scores[:player] += 1
    elsif detect_winner(board) == 'Computer'
      scores[:computer] += 1
    end
    break if scores[:player] == TOTAL_ROUNDS || scores[:computer] == TOTAL_ROUNDS

    display_board(board)
    puts "SCORES | Player : #{scores[:player]} | Computer : #{scores[:computer]} |"
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
  puts "SCORES | Player : #{scores[:player]} | Computer : #{scores[:computer]} |"
  if scores[:player] == TOTAL_ROUNDS
    prompt "Player wins!"
  else
    prompt "Computer wins!"
  end

  prompt "Play again? (y/n)"
  play_again = gets.chomp.downcase
  break if play_again == 'n'
  scores.each { |_, score| score = 0 }
end

prompt "Thanks for playing!"
