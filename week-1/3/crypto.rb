text = "the quick brown fox jumps things"

def letter_count string
  string.length
end

letters = letter_count text
puts "We had #{letters} letters"

letters = letter_count "this is inline"
puts "And #{letters} letters"
