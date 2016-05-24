require "./hangman"

h = Hangman.new

until h.over?
  puts h.board
  puts "Your guesses so far: #{h.guesses}"
  puts "What is your guess?"
  guess = gets.chomp

  h.record_guess guess
  puts "You have #{h.guesses_left} guesses left"
end

if h.won?
  puts "You win!"
else
  puts "You lost. The word was #{h.answer}"
end
