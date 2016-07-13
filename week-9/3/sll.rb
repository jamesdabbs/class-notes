require 'pry'

class Node
  attr_accessor :contents, :next_node

  def initialize contents
    @contents = contents
  end
end

class List
  attr_accessor :start

  def length
    count = 0
    current_node = @start
    until current_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def unshift number
    node = Node.new number
    node.next_node = @start
    @start = node
  end

  def push number
    node = Node.new number
    last_node.next_node = node
  end

  def last
    last_node.contents
  end

  def [] i
    # FIXME: what if i > length?
    current_node = @start
    i.times do
      current_node = current_node.next_node
    end
    current_node.contents
  end

  def include? n
    current_node = @start
    until current_node.nil?
      if current_node.contents == n
        return true
      end
      current_node = current_node.next_node
    end
    return false
  end

  private

  def last_node
    current_node = @start
    until current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node
  end
end

a = Node.new 5
b = Node.new 10
c = Node.new 3

a.next_node = b
b.next_node = c

l = List.new
l.start = a

l2 = List.new
l2.unshift 3
l2.unshift 10
l2.unshift 5

e = List.new

binding.pry
puts
