require "pry"

class NumberGame
  attr_reader :range

  def initialize
    @range  = 1 .. 100
    @answer = rand @range
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
      :high
    else
      puts "Too low"
      @attempts -= 1
      :low
    end
  end
end

class HumanPlayer
  def ask_for_number game
    puts "What is your guess (#{game.range})?"
    gets.chomp.to_i
  end
end

class DumbAI
  def ask_for_number game
    guess = rand game.range
    puts guess
    guess
  end
end

class SmartAI
  def initialize range
    @min = range.first
    @max = range.last
  end

  def ask_for_number g
    @last_guess = (@min + @max) / 2
    puts @last_guess
    @last_guess
  end

  def record_result result
    if result == :high
      @max = @last_guess
    elsif result == :low
      @min = @last_guess
    end
  end
end

g = NumberGame.new
# p = HumanPlayer.new
# p = DumbAI.new
p = SmartAI.new g.range
until g.over?
  n = p.ask_for_number g
  result = g.check_number n
  p.record_result result
end

if g.lost?
  puts "You lost. The answer was: #{g.answer}"
end
