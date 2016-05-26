class Player
  attr_reader :name, :board, :color

  def initialize name
    @name  = name
    @board = Board.new
  end
end
