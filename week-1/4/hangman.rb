require "pry"

until player_wants_to_quit
  # Play game one time
  until game_over?
    display_board
    choose_letter
    record_move
  end
end
