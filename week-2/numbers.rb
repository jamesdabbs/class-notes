require "pry"

class NumberGame
  def initialize
    @answer = rand(1 .. 100)
    @attempts = 5
  end

  def over?
    @attempts == 0 # || or won?
  end

  def ask_for_number
    puts "What is your guess?"
    gets.chomp
  end

  def check_number
  end
end

g = NumberGame.new
until g.over?
  g.ask_for_number
  g.check_number
end

binding.pry
