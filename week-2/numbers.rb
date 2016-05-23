require "pry"

class NumberGame
  def initialize
    @answer = rand(1 .. 100)
    @attempts = 5
    @won = false
  end

  # attr_reader :answer
  def answer
    @answer
  end

  def over?
    @attempts == 0 || @won
  end

  def lost?
    @attempts == 0
  end

  def ask_for_number
    puts "What is your guess?"
    gets.chomp.to_i
  end

  def check_number guess
    if guess == @answer
      puts "You win!"
      @won = true
    elsif guess > @answer
      puts "Too high"
      @attempts -= 1
    else
      puts "Too low"
      @attempts -= 1
    end
  end
end

g = NumberGame.new
until g.over?
  n = g.ask_for_number
  g.check_number n
end

if g.lost?
  puts "You lost. The answer was: #{g.answer}"
end

binding.pry
