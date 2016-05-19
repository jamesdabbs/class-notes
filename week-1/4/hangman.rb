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

loop do
  # Play game one time
  until game_over?
    display_board
    choose_letter
    record_move
  end
  break if player_wants_to_quit?
end
