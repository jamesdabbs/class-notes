require "pry"

def num_words_starting_with_t text
  num_words_starting_with_letter text, "t"
end

def num_words_starting_with_m text
  num_words_starting_with_letter text, "m"
end

def words_starting_with_letter text, letter
  words = text.split " "
  words.select do |w|
    w[0].downcase == letter.downcase
  end
end

def num_words_starting_with_letter text, letter
  words_starting_with_letter(text, letter).count
end

str = File.read "moog.txt"
words = str.split " "
binding.pry

x = num_words_starting_with_t str
puts "There are #{x} words starting with T"

x = num_words_starting_with_m str
puts "There are #{x} words starting with M"

w = words_starting_with_letter(str, "t").last
puts "The last T word is #{w}"
