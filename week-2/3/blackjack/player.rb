class Player
  attr_reader :wallet
  attr_accessor :hand

  def initialize wallet=0
    @wallet = wallet
    @hand = Hand.new
  end

  def wins amount
    @wallet += amount
  end

  def broke?
    @wallet <= 0
  end

  def get_bet
    loop do
      puts "How much are you betting?"
      n = gets.chomp.to_i
      if n > wallet
        puts "You can't bet more than you have!"
      elsif n < 1
        puts "You have to bet something"
      else
        return n
      end
    end
  end

  def get_move
    loop do
      puts hand
      puts "Would you like to hit (h) or stand (s)?"
      input = gets.chomp
      case input.downcase
      when "hit", "h"
        return "hit"
      when "stand", "s"
        return "stand"
      else
        puts "Invalid input: #{input}"
      end
    end
  end

  def done?
    puts "Would you like to keep playing (y/n)?"
    gets.chomp == "n"
  end
end
