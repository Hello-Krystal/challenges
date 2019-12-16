#The following ruby code implements a LinkedList:
class LinkedListNode
 attr_accessor :value, :next_node
 
 def initialize(value, next_node=nil)
   @value = value
   @next_node = next_node
 end
end
 
#create stack
class Stack
 attr_reader :data
 
 def initialize
   @data = nil
 end
 
 def push(value)
   @data = LinkedListNode.new(value, @data)
 end
 
 def pop
   while @data != nil
     value = @data.value
     @data = @data.next_node
     return value
   end
 end
end
 
def print_values(list_node)
 if list_node
   print "#{list_node.value} --> "
   print_values(list_node.next_node)
 else
   print "nil\n"
   return
 end
end
 
#recursion
def reverse_list(list)
 input = Stack.new
 while list
   input.push(list.value)
   list = list.next_node
 end
 
 output = Stack.new
 value = input.pop
 while value
   output.push value
   value = input.pop
 end
 
 value = output.pop
 new_list = nil
 while value
   new_list = LinkedListNode.new(value, new_list)
   value = output.pop
 end
 
 return new_list
 end
 
 
node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
 
print_values(node3)
puts "-------"
revlist = reverse_list(node3)
print_values(revlist)

