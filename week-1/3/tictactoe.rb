require "pry"

board = [
  :o, :o,  3,
  :x, :x, :x,
   7, :o,  9
]
# 3.upto 5 do |i|
#   print board[i]
# end
# puts
# 6.upto 8 do |i|
#   print board[i]
# end
# puts

current_player = :x
done = false

until done # game is over? winner or full?
  # display the board
  [0,3,6].each do |start|
    stop = start + 2
    start.upto stop do |i|
      print board[i]
    end
    puts
  end

  print "> "
  selected = gets.chomp.to_i

  # N.B. this assumes that the square is valid
  # and open, but we should check that
  # board[selected - 1] = current_player

  # if current_player == :x
  #   current_player = :o
  # else
  #   current_player = :x
  # end

  # current_player = if current_player == :x
  #   :o
  # else
  #   :x
  # end

  # Did someone win?
  [
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [1,4,7],
    [2,5,8],
    [3,6,9],
    [1,5,9],
    [3,5,7]
  ].each do |combo|
    # combo = [4,5,6]
    plays = [
      board[ combo[0] - 1 ],
      board[ combo[1] - 1 ],
      board[ combo[2] - 1 ]
    ]
    if plays.uniq == [:x]
      puts "X wins!"
      done = true
    elsif plays.uniq == [:o]
      puts "O wins!"
      done = true
    end
  end

  # Is the board full?
  full = true
  board.each do |square|
    if square.is_a? Integer
      full = false
      break # for performance only
    end
  end
  if full
    puts "Board is full! Tie!"
    done = true
  end

  current_player = current_player == :x ? :o : :x
end
