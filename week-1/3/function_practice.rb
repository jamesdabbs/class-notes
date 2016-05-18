require "pry"

def get_player_count
  loop do
    puts "How many players?"
    players = gets.chomp.to_i
    if players == 1 || players == 2
      return players
    else
      puts "That's a crazy number"
    end
  end
end

# get_player_count
# get_player_count

num_players = get_player_count
num_players.times do |i|
  puts "Player #{i}: what is your name?"
  gets.chomp
end
