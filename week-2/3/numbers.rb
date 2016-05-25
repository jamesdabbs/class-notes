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
      @won = true
    elsif guess > @answer
      @attempts -= 1
      :high
    else
      @attempts -= 1
      :low
    end
  end
end

class HumanPlayer
  def initialize _
  end

  def ask_for_number game
    puts "What is your guess (#{game.range})?"
    gets.chomp.to_i
  end

  def record_result result
    if result == :high
      puts "Too high!"
    elsif result == :low
      puts "Too low!"
    else
      puts "You win!"
    end
  end
end

class DumbAI
  def initialize _
  end
  
  def ask_for_number game
    guess = rand game.range
    puts guess
    guess
  end

  # def record_result _
  # end
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

puts "Who is playing? (h)uman, (s)mart ai, (d)umb ai"
selection = gets.chomp

klass = if selection == "h"
  HumanPlayer
elsif selection == "s"
  SmartAI
elsif selection == "d"
  DumbAI
end

p = klass.new g.range

until g.over?
  n = p.ask_for_number g
  result = g.check_number n
  if p.respond_to? :record_result
    p.record_result result
  end
end

if g.lost?
  puts "You lost. The answer was: #{g.answer}"
end
