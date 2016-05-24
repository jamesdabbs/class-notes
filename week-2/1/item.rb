require "pry"

class Item
  BaseTax = 1.07

  def initialize starting_price
    @base_price = starting_price
    @is_on_sale = false
  end

  def is_on_sale?
    @is_on_sale
  end

  def price
    if is_on_sale?
      (@base_price * 0.9).round(2)
    else
      @base_price
    end
  end

  def price_with_tax
    # (@base_price * BaseTax).round(2)
    (price * 1.07).round(2)
  end

  def add_discount
    @is_on_sale = true
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
