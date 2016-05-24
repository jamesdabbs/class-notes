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

  def test_can_record_bad_guess
    # setup ...
    g = Hangman.new # banana
    assert_equal 6, g.guesses_left

    # perform ...
    g.record_guess "z"

    # assertions ...
    assert_equal 5, g.guesses_left
  end

  def test_can_record_good_guess
    g = Hangman.new # banana
    assert_equal 6, g.guesses_left

    g.record_guess "a"

    assert_equal 6, g.guesses_left
    assert_equal "_a_a_a", g.board
  end
end
