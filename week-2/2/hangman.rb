class Hangman
  def initialize
    @guesses_left = 6
    @answer = "banana"
    @guesses = []
  end

  def over?
    @guesses_left == 0 || won?
  end

  def won?
    @answer.split("").all? do |c|
      @guesses.include? c
    end
  end

  def guesses_left
    @guesses_left
  end

  def record_guess guess
    @guesses.push guess
    if @answer.include?(guess)
      # ... stuff ... ?
    else
      @guesses_left -= 1
    end
  end

  def board
    board_array = @answer.split("").map do |c|
      if @guesses.include?(c)
        c
      else
        "_"
      end
    end
    board_array.join ""
  end
end
