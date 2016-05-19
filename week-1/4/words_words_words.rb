def words_starting_with_t text
end

str = File.read "moog.txt"

x = words_starting_with_t str
puts "There are #{x} words starting with T"
