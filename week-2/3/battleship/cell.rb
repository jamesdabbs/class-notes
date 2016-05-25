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
end
