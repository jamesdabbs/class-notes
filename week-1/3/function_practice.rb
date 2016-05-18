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

def check_random
  n = rand(1 .. 100)
  puts "n is #{n}"
  if n.even?
    :even
  elsif n > 80
    :odd
  end
  # :how_did_i_get_here?
end

out = check_random
puts "out was: #{out}"

# get_player_count
# get_player_count

# num_players = get_player_count
# num_players.times do |i|
#   puts "Player #{i}: what is your name?"
#   gets.chomp
# end
