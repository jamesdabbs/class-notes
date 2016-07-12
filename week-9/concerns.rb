require "pry"

module Duplicator
  def Duplicator.included other
    other.extend Other
  end

  def asdf
    puts "asdf" * count
  end

  def zxcv
    puts "zxcv" * count
  end

  def duplicatable?
    true
  end
end

module Other
  def r
    puts "calling r"
  end
end

class Thing
  include Duplicator # Instance methods
  # extend  Other      # Class method

  def initialize n
    @count = n
  end

  def count
    @count
  end
end

binding.pry
puts
