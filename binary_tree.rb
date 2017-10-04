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

  #def breadth_first_search(value)
  #  searched = value
  #  q = [@root]
  #  @size.times do
  #    first = q[0]
  #    p first.value
  #    if first.value == searched
  #      puts "#{searched} has been located"
  #      break
  #    end
  #    if q[0].child_left != nil
  #      q << q[0].child_left
  #    end
  #    if q[0].child_right != nil
  #      q << q[0].child_right
  #    end
  #    q.shift
  #  end
  #    puts "#{searched} is not in this tree"
  #end

  def breadth_first_search(value)
    searched = value
    q = [@root]
    count = 0
    @size.times do
      first = q[0]
      p first.value
      if first.value == searched
        puts "#{searched} has been located"
        break
      elsif first.value != searched
        if q[0].child_left != nil
          q << q[0].child_left
        end
        if q[0].child_right != nil
          q << q[0].child_right
        end
        q.shift
        count +=1
        if count == @size
          puts "#{searched} is not in this tree"
          nil
        end
      end
    end
  end


end

def build_tree(array,tree_name)
	tree_name = BinaryTree.new
	array.map do |n|
		tree_name.add_node(n)
	end
	p tree_name
end

array = [14,23,13,16,15,4,9,7,34,54,3,56]
test = build_tree(array,"tom")
test.breadth_first_search(4)
