class Ship
  attr_reader :length, :name

  def initialize length, name
    @length, @name = length, name
    @times_hit = 0
  end

  def sunk?
    @times_hit >= @length
  end

  def hit!
    @times_hit += 1
    if @times_hit == @length
      system "say 'You sunk my #{@name}'"
    end
  end

  def hit_count
    @times_hit
  end
end
