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

def display_board board
  puts "The board is: #{board.join(' ')}"
end

def choose_letter
  print "Your move > "
  input = gets.chomp
end

def record_move l, answer, grid
  letters = answer.split ""
  i = 0
  letters.each do |c|
    if l == c
      grid[i] = c
    end
    i += 1
  end

  # update board
  # update guesses left
  # history
end

loop do
  word = get_a_word
  warn "The word is: #{word}"
  b = ["_"] * word.length

  # Play game one time
  until game_over?
    display_board b
    letter = choose_letter
    record_move letter, word, b
  end
  break if player_wants_to_quit?
end
