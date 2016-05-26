require "pry"
require "minitest/autorun"
require "minitest/focus"

begin
  require "minitest/reporters"
  Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new
rescue LoadError
  warn "`gem install minitest-reporters` for pretty test output"
end


require "./board"

class BoardTest < Minitest::Test
  def test_boards_have_a_grid
    b = Board.new
    c = b.at "A1"
    assert c.is_a?(Cell)
  end
end

class CellTest < Minitest::Test
  def test_cells_can_be_occupied
    c = Cell.new
    refute c.occupied?

    c.place_ship Ship.new(4)
    assert c.occupied?
  end

  def test_cells_can_have_a_peg
    c = Cell.new
    refute c.has_peg?

    c.fire!
    assert c.has_peg?
    assert c.miss?
    refute c.hit?
  end

  def test_cells_can_hit_ships
    c = Cell.new
    c.place_ship Ship.new(4)

    c.fire!
    assert c.has_peg?
    refute c.miss?
    assert c.hit?
  end
end

class ShipTests < Minitest::Test
  def test_ships_have_a_length
    sub = Ship.new 3
    assert_equal 3, sub.length
  end

  def test_ships_can_be_sunk
    cruiser = Ship.new 3
    refute cruiser.sunk?

    cruiser.hit!
    cruiser.hit!
    refute cruiser.sunk?

    cruiser.hit!
    assert cruiser.sunk?
  end
end
