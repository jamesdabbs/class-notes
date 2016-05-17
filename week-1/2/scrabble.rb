require "pry"

f = File.open "scores.txt", "w"

puts "Welcome to Scrabble"
print "How many players? "
players = gets.chomp.to_i
# players = 4

totals = []
maxes = []
players.times do
  totals.push 0
  maxes.push 0
end

input = nil
current_player = 1

until input == "quit"
  print "Player #{current_player}, your score? "
  input = gets.chomp
  score = input.to_i
  totals[ current_player - 1 ] += score
  # if score > max
  #   max = score
  # end

  current_player += 1
  if current_player > players
    current_player = 1
  end
end

puts "Final scores:"
i = 1
totals.each do |total|
  puts "Player #{i}: #{total}"
  f.puts "Player #{i}: #{total}"
  i += 1
end

f.close
