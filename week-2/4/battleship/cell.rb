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
    if @fired_on
      raise "Cell has already been fired on"
    else
      @fired_on = true
      ship.hit! unless ship.nil?
    end
  end

  def miss?
    has_peg? && !occupied?
  end

  def hit?
    has_peg? && occupied?
  end
end
