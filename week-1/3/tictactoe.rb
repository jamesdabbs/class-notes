require "pry"

def board_is_full? b
  # b.none? { |s| s.is_a? Integer }
  b.each do |square|
    # if square.is_a? Integer
    #   return false
    # end
    return false if square.is_a? Integer
  end
  true
end

def display_the_board board
  [0,3,6].each do |start|
    stop = start + 2
    start.upto stop do |i|
      print "#{board[i]} "
    end
    puts
  end
end

# NO! winning_combos = [
def winning_combos
  [
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [1,4,7],
    [2,5,8],
    [3,6,9],
    [1,5,9],
    [3,5,7]
  ]
end

def have_winner? board
  winning_combos.each do |combo|
    # combo = [4,5,6]
    plays = [
      board[ combo[0] - 1 ],
      board[ combo[1] - 1 ],
      board[ combo[2] - 1 ]
    ]
    if plays.uniq == [:x]
      puts "X wins!"
      return true
    elsif plays.uniq == [:o]
      puts "O wins!"
      return true
    end
  end
  false
end

def record_move board, active
  print "> "
  selected = gets.chomp.to_i

  board[selected - 1] = active
end

def game_over? board
  have_winner?(board) || board_is_full?(board)
end

# -------

board = [
  1, 2, 3,
  4, 5, 6,
  7, 8, 9
]

current_player = :x
done = false


until game_over? board
  display_the_board board
  record_move board, current_player

  puts "We have winner" if have_winner? board
  puts "Board is full! Tie!" if board_is_full? board

  current_player = current_player == :x ? :o : :x
end

display_the_board board
