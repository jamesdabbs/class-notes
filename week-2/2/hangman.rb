h = Hangman.new

until h.over?
  puts "What is your guess?"
  guess = gets.chomp

  h.record_guess guess
end

if h.won?
  puts "You win!"
else
  puts "You lost. The word was #{h.answer}"
end
