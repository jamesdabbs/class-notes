require "pry"

print "What max? "
max = gets.to_i

list = 1 .. max

list.each do |n|
  if n.modulo(5) == 0 && n.modulo(3) == 0
    puts "Fizzbuzz"
  elsif n.modulo(5) == 0 # n % 5 ... n.modulo(0).zero?
    puts "Buzz"
  elsif n.modulo(3) == 0
    puts "Fizz"
  else
    puts n
  end
end
