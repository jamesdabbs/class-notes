require "./cell"

class Board
  def initialize
    @grid = {}
    (1..10).each do |col|
      ("A".."J").each do |row|
        key = "#{row}#{col}"
        @grid[key] = Cell.new
      end
    end
  end

  def at position
    @grid[position]
  end
end
