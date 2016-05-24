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

  def minus other_currency
    unless denomination == other_currency.denomination
      raise "You can't subtract #{denomination} and #{other_currency.denomination}"
    end

    unless amount > other_currency.amount
      raise "You can't have negative monies"
    end

    Currency.new(
      amount - other_currency.amount,
      denomination
    )
  end

  def == other
    amount == other.amount &&
      denomination == other.denomination
  end

  def + other
    plus other
  end

  def - other
    minus other
  end
end

require "minitest/autorun"

class CurrencyTest < Minitest::Test
  def five_dollars
    Currency.new 5, :usd
  end

  def test_amount
    assert_equal five_dollars.amount, 5
  end

  def test_denomination
    assert_equal five_dollars.denomination, :usd
  end
end

# five_dollars = Currency.new(5, :usd)
# ten_dollars = Currency.new(10, :usd)
#
# puts "#{five_dollars.amount} is 5"
# puts "#{five_dollars.denomination} is usd"
#
# prod = five_dollars.times(4)
# puts "prod is #{prod.amount}#{prod.denomination}"
# # binding.pry
#
# sum = five_dollars.plus ten_dollars
# puts "sum is #{sum.amount}#{sum.denomination}"
#
# diff = ten_dollars.minus five_dollars
# puts "diff is #{diff.amount}#{diff.denomination}"
# # binding.pry
#
# begin
#   diff2 = five_dollars.minus ten_dollars
#   puts "diff2 is #{diff2.amount}#{diff2.denomination}"
# rescue => e
#   puts "There was an error, but it's okay now"
#   puts "The error was: #{e}"
# # ensure
# #   puts "Carrying on ..." ?
# end
#
# puts "Carrying on ..."
# binding.pry
