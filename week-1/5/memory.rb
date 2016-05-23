require "pry"


def generate_board
  options = (1 .. 8).to_a
  shuffled = (options + options).shuffle

  board = {
    "A" => [],
    "B" => [],
    "C" => [],
    "D" => []
  }

  board.each do |letter, row|
    4.times do
      row.push shuffled.shift
    end
  end

  board
end

def value_for board, move
  letter = move[0]
  index = move[1].to_i
  board[letter][index - 1]
end

def show_answers board
  board.each do |letter, row|
    puts row.join " "
  end
end

def display_board board, visibles
  system "clear"
  board.each do |letter, row|
    1.upto 4 do |i|
      tile = "#{letter}#{i}"
      if visibles.include?(tile)
        print " " + row[i - 1].to_s
      else
        print tile
      end
      print " "
    end
    puts
  end
end

def get_move
  # TODO: validate
  gets.chomp.capitalize
end

def take_turn board, visibles
  display_board board, visibles
  move = get_move

  temp_visibles = visibles + [move]
  display_board board, temp_visibles

  second_move = get_move
  temp_visibles.push second_move
  display_board board, temp_visibles

  if value_for(board, move) == value_for(board, second_move)
    puts "They match!"
    visibles.push move
    visibles.push second_move
  end
end


b = generate_board
visibles = []

until visibles.count == 16
  take_turn b, visibles
  puts "Press enter for next turn"
  gets
end
puts "You win!"
