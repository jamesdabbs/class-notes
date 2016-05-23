require "pry"

class NumberGame
  def initialize
    @answer = rand(1 .. 100)
    @attempts = 5
    @won = false
  end

  def over?
    @attempts == 0 || @won
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

binding.pry
