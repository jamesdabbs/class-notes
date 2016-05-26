require "./ship"

class Cell
  attr_reader :ship

  def occupied?
    !@ship.nil?
  end

  def place_ship ship
    @ship = ship
  end

  def has_peg?
    @fired_on == true
  end

  def fire!
    @fired_on = true
    ship.hit! unless ship.nil?
  end

  def miss?
    has_peg? && !occupied?
  end

  def hit?
    has_peg? && occupied?
  end
end
