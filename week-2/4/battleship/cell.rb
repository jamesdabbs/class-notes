require "./ship"

class Cell
  def occupied?
    # if @ship.nil?
    #   false
    # else
    #   true
    # end
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
  end

  def miss?
    has_peg? && !occupied?
  end

  def hit?
    has_peg? && occupied?
  end
end
