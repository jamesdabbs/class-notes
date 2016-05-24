require "pry"

class Currency
  attr_reader :amount, :denomination

  def initialize amt, denom
    @amount, @denomination = amt, denom
  end

  def times n
    Currency.new(amount * n, denomination)
  end

  def plus other_currency
    if denomination == other_currency.denomination
      Currency.new(
        amount + other_currency.amount,
        denomination
      )
    else
      raise "You can't add #{denomination} and #{other_currency.denomination}"
    end
  end
end

five_dollars = Currency.new(5, :usd)
ten_dollars = Currency.new(10, :gpb)

puts "#{five_dollars.amount} is 5"
puts "#{five_dollars.denomination} is usd"

prod = five_dollars.times(4)
puts "prod is #{prod.amount}#{prod.denomination}"
# binding.pry

sum = five_dollars.plus ten_dollars
puts "sum is #{sum.amount}#{sum.denomination}"

# binding.pry
