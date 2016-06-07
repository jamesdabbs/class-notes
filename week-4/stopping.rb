require "pry"

begin
  loop do
    puts "tick"
    sleep 1
  end
rescue Interrupt => e
  binding.pry
  puts "asdf"
end
