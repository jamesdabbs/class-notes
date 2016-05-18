require "pry"

def get_player_count
  players = nil
  until players == 1 || players == 2
    puts "How many players?"
    players = gets.chomp.to_i
  end
  puts "You said #{players} players"
  return players
end

# get_player_count
# get_player_count

num_players = get_player_count
num_players.times do |i|
  puts "Player #{i}: what is your name?"
  gets.chomp
end
