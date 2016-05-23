require "pry"

class Item
  def price
    rand(1 .. 100)
  end

  def price_with_tax
    (price * 1.07).round(2)
  end
end

widget = Item.new
thing = Item.new
binding.pry
