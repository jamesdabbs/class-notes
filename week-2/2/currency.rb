require "pry"

class Currency
  attr_reader :amount, :denomination

  def initialize amt, denom
    @amount, @denomination = amt, denom
  end

  def times n
    new_amount = amount * n
    Currency.new(new_amount, denomination)
  end
end

five_dollars = Currency.new(5, :usd)
ten_dollars = Currency.new(10, :usd)

puts "#{five_dollars.amount} is 5"
puts "#{five_dollars.denomination} is usd"

prod = five_dollars.times(4)
puts "prod is #{prod.amount}#{prod.denomination}"
# binding.pry
