module MyEnumerable
  # def map
  def map &block
    result = []
    self.each do |n|
      # val = yield n
      val = block.call n
      result.push val
    end
    return result
  end

  def select &block
    result = []
    self.each do |n|
      if block.call n
        result.push n
      end
    end
    return result
  end
end

class Counter
  def initialize stop=10
    @start = 0
    @stop  = stop
  end

  include MyEnumerable

  def each &block
    @start.upto @stop do |n|
      block.call n
    end
  end
end

class InfiniteCounter
  def initialize
    @start = 0
  end

  include MyEnumerable

  def each
    loop do
      yield @start
      @start += 1
    end
  end
end

require "pry"
c = Counter.new
binding.pry
puts
