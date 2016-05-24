class Hangman
  def initialize
    @guesses_left = 6
  end

  def over?
    false
  end

  def guesses_left
    @guesses_left
  end

  def record_guess x
    @guesses_left -= 1
  end
end
