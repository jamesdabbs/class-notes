require "./cell"

class Board
  class DuplicatePositionError < StandardError; end

  def initialize
    @ships = []
    @grid = {}
    (1..10).each do |col|
      ("A".."J").each do |row|
        key = "#{row}#{col}"
        @grid[key] = Cell.new
      end
    end
  end

  def at position
    @grid[position.upcase]
  end

  def to_s display_ships=false
    output = ""

    header = [" "] + (1 .. 10).map { |n| n.to_s }
    output += header.join(" ")
    output += "\n"

    ("A" .. "J").each do |letter|
      output += "#{letter} "
      (1 .. 10).each do |col|
        cell = at "#{letter}#{col}"
        if display_ships && cell.occupied? && !cell.hit?
          output += "S "
        else
          output += "#{cell} "
        end
      end
      output += "\n"
    end

    output
  end

  def fire_on position
    begin
      at(position).fire!
      true
    rescue NoMethodError
      puts "That position was out of bounds"
      false
    rescue DuplicatePositionError
      puts "That position has already been fired on"
      false
    end
  end

  def place ship, positions
    @ships.push ship
    positions.each do |pos|
      at(pos).place_ship ship
    end
  end

  def all_ships_sunk?
    @ships.all? { |s| s.sunk? }
  end
end
