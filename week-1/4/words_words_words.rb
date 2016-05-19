require "pry"

def num_words_starting_with_t text
  total = 0
  words = text.split(" ")
  words.each do |w|
    if w[0] == "t" || w[0] == "T"
      total += 1
    end
  end
  total
end

str = File.read "moog.txt"

x = num_words_starting_with_t str
puts "There are #{x} words starting with T"
