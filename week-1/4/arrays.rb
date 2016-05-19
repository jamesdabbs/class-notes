require "pry"

def sum_of_line numbers
  sum = 0
  numbers.each do |n|
    sum += n.to_i
  end
  puts "The sum is: #{sum}"
end

# --------

contents = File.read "numbers.txt"
lines = contents.split "\n"

first_line = lines.first
numbers = lines[2].split ","

sum_of_line numbers