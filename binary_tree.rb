class Node
  attr_accessor :child_left, :child_right, :parent
  attr_reader :value
  def initialize(value = nil)
    @value = value
    @child_left = nil
    @child_right = nil
    @parent = nil
  end
end


class BinaryTree
  attr_accessor :root, :size
  def initialize
    @root = nil
    @size = 0
  end

  def add_node(value)
    if @root == nil
      add_root(value)
    else #assign root if not yet assigned
      add_children(value) #add children
    end
      @size += 1
  end

  def add_root(value)
      @root = Node.new(value)
  end

  def check_if_available(node,new_node)
    new_node = new_node
    current_node = node
      if new_node.value <= current_node.value && current_node.child_left == nil
        current_node.child_left = new_node
        new_node.parent = current_node
      elsif new_node.value >= current_node.value && current_node.child_right == nil
        new_node.parent = current_node
        current_node.child_right = new_node
      elsif new_node.value <= current_node.value && current_node.child_left != nil
        check_if_available(current_node.child_left, new_node)
      elsif new_node.value >= current_node.value && current_node.child_right != nil
        check_if_available(current_node.child_right, new_node)
      end
  end

  def add_children(value)
    new_node = Node.new(value)
    current_node = @root
    check_if_available(current_node, new_node)
  end

end

def build_tree(array,tree_name)
  tree_name = BinaryTree.new
  array.map do |n|
  tree_name.add_node(n)
  end
  puts tree_name
end

array = [14,23,2,16,13,4,7,34,54,3,56]
build_tree(array,"tom")

#test = BinaryTree.new
#test.add_node(10)
#test.add_node(4)
#test.add_node(12)
#test.add_node(33)
#test.add_node(42)
#test.add_node(3)
#test.add_node(7)
#test.add_node(8)
#p test
