# Reverse a linked list using mutation
class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def print_values(list)
    if !list
      puts "nil\n"
      return
    else
      print "#{list.value} --> "
      print_values(list.next_node)
    end
  end

#mutation
  def reverse_list(list, previous = nil)
    if list
      next_node = list.next_node
      list.next_node = previous
      reverse_list(next_node, list)
    end
  end
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

node3.print_values(node3)
puts '---------'
node3.reverse_list(node3)
node1.print_values(node1)