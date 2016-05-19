require "pry"

def num_words_starting_with_letter text, letter
  total = 0
  words = text.split " "
  words.each do |w|
    if w[0].downcase == letter.downcase
      total += 1
    end
  end
  total
end

def num_words_starting_with_t text
  num_words_starting_with_letter text, "t"
end

def num_words_starting_with_m text
  num_words_starting_with_letter text, "m"
end

str = File.read "moog.txt"

x = num_words_starting_with_t str
puts "There are #{x} words starting with T"

x = num_words_starting_with_m str
puts "There are #{x} words starting with M"
