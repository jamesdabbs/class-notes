require "pry"

def sum_of_array numbers
  sum = 0
  numbers.each do |n|
    sum += n.to_i
  end
  sum
end

def sum_of_all_lines lines
  row_sums = []
  lines.each do |line|
    row_sum = sum_of_array line.split(",")
    row_sums.push row_sum
  end
  sum_of_array row_sums
end

# --------

contents = File.read "numbers.txt"
lines = contents.split "\n"

# 30265
total = sum_of_all_lines lines
puts "The total is: #{total}"
