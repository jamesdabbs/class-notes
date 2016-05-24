require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require "pry"
require "./hangman"

class HangmanTest < Minitest::Test
  def test_is_not_over_at_the_start
    g = Hangman.new
    assert_equal false, g.over?
  end
end
