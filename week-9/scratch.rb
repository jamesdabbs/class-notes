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

  include Enumerable

  def each &block
    @start.upto @stop do |n|
      block.call n
    end
  end

  def floop n
    puts "n is #{n}"
    yield 1
    yield 2341234
    # sleep 1
    yield 345
  end

  def floop2 thing_to_do
    thing_to_do.call "from floop2"
  end
end
#
# c = Counter.new 20
# c.floop 10 do |n|
#   i = n.to_s.reverse.to_i
#   puts "#{i} ~ #{n}"
# end
#
# # yell = Proc.new do |v|
# #   puts v.upcase
# # end
# class Upcaser
#   def call str
#     puts str.upcase
#   end
# end
# c.floop2 Upcaser.new

class MyObj
  attr_accessor :name, :email

  def initialize
    yield self
    freeze
  end
end

dana = MyObj.new do |o|
  o.name  = "Dana"
  o.email = "dana@theironyard.com"
end

# File.open "file.txt", "w" do |f|
#   f.puts "something"
# end

c = Counter.new
binding.pry
puts
