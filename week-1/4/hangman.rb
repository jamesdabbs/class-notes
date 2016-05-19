require "pry"

def player_wants_to_quit?
  puts "Do you want to keep playing (y/n)?"
  input = gets.chomp
  # input == "n"
  if input == "n"
    true
  else
    false
  end
end

def game_over?
  # out_of_turns || won?
  false
end

def get_a_word
  [
    "aardwolf",
    "banana",
    "rails",
    "fizzbuzz"
  ].sample
end

def display_board
  word = get_a_word
  warn "The word is: #{word}"
  board = ["_"] * word.length
  puts "The board is: #{board.join(' ')}"
end

loop do
  # Play game one time
  until game_over?
    display_board
    choose_letter
    record_move
  end
  break if player_wants_to_quit?
end
