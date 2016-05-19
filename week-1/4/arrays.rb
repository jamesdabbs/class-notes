require "pry"

def sum_of_array numbers
  sum = 0
  numbers.each do |n|
    sum += n.to_i
  end
  sum
  # puts "The sum is: #{sum}"
end

# --------

contents = File.read "numbers.txt"
lines = contents.split "\n"

# first_line = lines.first
# numbers = lines[2].split ","
#
# sum_of_array numbers

total = 0
lines.each do |line|
  row_sum = sum_of_array line.split(",")
  total += row_sum
end
puts "The total is: #{total}"
