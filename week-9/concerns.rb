require "pry"

module Duplicator
  def Duplicator.included other
    other.extend Duplicator::ClassMethods
  end

  def asdf
    puts "asdf" * count
  end

  def zxcv
    puts "zxcv" * count
  end

  module ClassMethods
    def duplicatable?
      true
    end
  end
end


class Thing
  include Duplicator

  def initialize n
    @count = n
  end

  def count
    @count
  end
end

binding.pry
puts
