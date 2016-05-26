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
      at(position.upcase).fire!
    rescue => e
      puts e
    end
  end
end
