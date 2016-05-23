require "pry"

class Item
  def initialize
    @my_price = 100
  end

  def price
    @my_price
  end

  def price_with_tax
    (@my_price * 1.07).round(2)
    # (price * 1.07).round(2)
  end

  def add_discount
    with_discount = (@my_price * 0.9).round(2)
    @my_price = with_discount
  end
end

widget = Item.new
thing = Item.new
binding.pry
