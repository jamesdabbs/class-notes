require 'pry'

class Node
  attr_accessor :left, :right
  attr_reader :contents

  def initialize contents
    @contents = contents
  end
end

class Tree
  attr_reader :root

  def insert n
    node = Node.new n
    if @root.nil?
      @root = node
      return
    end

    curr = @root
    loop do
      if n > curr.contents
        if curr.right
          curr = curr.right
        else
          curr.right = node
          return
        end
      else
        if curr.left
          curr = curr.left
        else
          curr.left = node
          return
        end
      end
    end
  end

  def include? waldo
    return false if @root.nil?

    curr = @root
    until curr.nil?
      # puts "Stepping"
      # sleep 1
      if curr.contents == waldo
        return true
      elsif waldo < curr.contents
        curr = curr.left
      else
        curr = curr.right
      end
    end
    return false
  end
end

t = Tree.new
t.insert 16
t.insert 42
t.insert 36
t.insert 10
t.insert 54
t.insert 12
t.insert 1.3

binding.pry
puts
