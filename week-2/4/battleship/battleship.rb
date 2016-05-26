require "pry"

require "./board"
require "./player"

current_player = Player.new "Player 1"
battleship = Ship.new(4, "Battleship")
current_player.board.at("A1").place_ship battleship
current_player.board.at("A2").place_ship battleship
current_player.board.at("A3").place_ship battleship
current_player.board.at("A4").place_ship battleship

opponent = Player.new "Player 2"
carrier = Ship.new(5, "Carrier")
opponent.board.at("A1").place_ship carrier
opponent.board.at("B1").place_ship carrier
opponent.board.at("C1").place_ship carrier
opponent.board.at("D1").place_ship carrier
opponent.board.at("E1").place_ship carrier

loop do
  system "clear"

  puts "#{current_player.name}'s board"
  puts current_player.board.to_s(true)

  puts
  puts "#{opponent.name}'s board"
  puts opponent.board

  print "Your move, #{current_player.name} > "
  move = gets.chomp
  move_was_valid = opponent.board.fire_on move

  if opponent.board.all_ships_sunk?
    puts "You win!"
    break
  end

  if move_was_valid
    current_player, opponent = opponent, current_player
  else
    puts "Try again ..."
  end
  puts "Press enter to continue"
  gets
end
