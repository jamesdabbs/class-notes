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
    lost? || won?
  end

  def lost?
    @attempts == 0
  end

  def won?
    @won
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

class HumanPlayer
  def ask_for_number
    puts "What is your guess?"
    gets.chomp.to_i
  end
end

class DumbAI
  def ask_for_number
    guess = rand 1 .. 100
    puts guess
    guess
  end
end

g = NumberGame.new
# p = HumanPlayer.new
p = DumbAI.new
until g.over?
  n = p.ask_for_number
  g.check_number n
end

if g.lost?
  puts "You lost. The answer was: #{g.answer}"
end
