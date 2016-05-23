require "pry"

class Item
  BaseTax = 1.07

  def initialize starting_price
    @my_price = starting_price
  end

  def price
    if @discount_price
      @discount_price
    else
      @my_price
    end
  end

  def price_with_tax
    # (@my_price * BaseTax).round(2)
    (price * 1.07).round(2)
  end

  def add_discount
    @discount_price = (@my_price * 0.9).round(2)
  end
  def add_discout
    add_discount
  end
end

widget = Item.new 5
thing = Item.new 10

widget.add_discount
puts widget.price_with_tax

binding.pry
