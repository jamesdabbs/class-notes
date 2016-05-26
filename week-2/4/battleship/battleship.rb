require "pry"

require "./board"

class Player
  attr_reader :name, :board, :color

  def initialize name
    @name  = name
    @board = Board.new
  end
end

current_player = Player.new "Player 1"
current_player.board.at("A3").place_ship Ship.new(4, "Battleship")

opponent = Player.new "Player 2"
opponent.board.at("C5").place_ship Ship.new(2, "Patrol Boat")

loop do
  system "clear"

  puts "#{current_player.name}'s board"
  puts current_player.board.to_s(true)

  puts
  puts "#{opponent.name}'s board"
  puts opponent.board

  print "Your move, #{current_player.name} > "
  move = gets.chomp
  opponent.board.fire_on move

  current_player, opponent = opponent, current_player
end
