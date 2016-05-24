class Currency
  def initialize amt, denom
    @amount = amt
    @denomination = denom
  end

  def amount
    @amount
  end

  def denomination
    @denomination
  end
end

five_dollars = Currency.new(5, :usd)
ten_dollars = Currency.new(10, :usd)

puts "#{five_dollars.amount} is 5"
puts "#{five_dollars.denomination} is usd"
