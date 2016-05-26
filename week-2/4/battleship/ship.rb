class Ship
  attr_reader :length

  def initialize length
    @length = length
    @times_hit = 0
  end

  def sunk?
    @times_hit >= @length
  end

  def hit!
    @times_hit += 1
  end
end
