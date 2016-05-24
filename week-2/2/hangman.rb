class Hangman
  attr_reader :guesses, :answer, :guesses_left

  def initialize word="banana"
    @guesses_left = 6
    @answer = word
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

  def record_guess guess
    @guesses.push guess
    unless @answer.include?(guess)
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
