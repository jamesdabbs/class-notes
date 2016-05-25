require "./ship"

class Cell
  def initialize
    @occupied = false
  end

  def occupied?
    @occupied
  end

  def place_ship ship
    @occupied = true
  end
end
