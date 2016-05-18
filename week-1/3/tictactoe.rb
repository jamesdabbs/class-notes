require "pry"

def board_is_full? b
  full = true
  b.each do |square|
    if square.is_a? Integer
      full = false
      break # for performance only
    end
  end
end

def display_the_board board
  [0,3,6].each do |start|
    stop = start + 2
    start.upto stop do |i|
      print board[i]
    end
    puts
  end
end

def have_winner? board
  combos = [
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [1,4,7],
    [2,5,8],
    [3,6,9],
    [1,5,9],
    [3,5,7]
  ]

  combos.each do |combo|
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

board = [
  :o, :o,  3,
  :x,  5, :x,
   7, :o,  9
]

current_player = :x
done = false

until done # game is over? winner or full?
  display_the_board board

  print "> "
  selected = gets.chomp.to_i

  # Did someone win?
  if have_winner? board
    puts "We have winner"
    done = true
  end

  if board_is_full? board
    puts "Board is full! Tie!"
    done = true
  end

  current_player = current_player == :x ? :o : :x
end
