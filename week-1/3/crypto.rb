require "pry"

text = "the quick brown fox jumps things"

def letter_count(string)
  string.length
end

# letters = letter_count(text)
# puts "We had #{letters} letters"
#
# letters = letter_count("this is inline")
# puts "And #{letters} letters"

def word_count corpus
  corpus.split.count
end

words = word_count text
puts "We had #{words} words"
puts "Or #{word_count text} words"

def particular_letter a, letter
  characters = a.split("")
  seen_count = 0
  characters.each do |c|
    if c == letter
      seen_count += 1
    end
  end
  seen_count
end

e_count = particular_letter text, 'e'
t_count = particular_letter text, 't'
puts "There are #{e_count} e's"
puts "and #{t_count} t's"


def count_all_letters p
  characters = p.split("")
  total = {}
  characters.each do |char|
    if total[ char ] # total.include?(char)
      total[ char ] += 1
    else
      total[ char ] = 1
    end
  end
  total
end

counts = count_all_letters text
puts "Counts: #{counts}"
puts "t's: #{counts['t']}"
puts "z's: #{counts['z']}"
