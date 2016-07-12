require "pry"

# module Roles
#   Role = Struct.new :description, :key, :permission_level
#
#   Trial     = Role.new "Trial user", :demo, 0
#   User      = Role.new "Regular user", :user, 1
#   Moderator = Role.new "Moderator", :mod, 2
#   Admin     = Role.new "System administrator", :admin, Float::INFINITY
# end

class Counter
  def initialize stop=10
    @start = 0
    @stop  = stop
  end

  def each n, &block
    puts "n is #{n}"
    # @start.upto(@stop).each do |number|
    #   block.call number
    # end
    block.call 1
    block.call 2341234
    sleep 1
    block.call 345
  end
end

c = Counter.new 20
c.each 10 do |n|
  i = n.to_s.reverse.to_i
  puts "#{i} ~ #{n}"
end

# binding.pry
puts
