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
