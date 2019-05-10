require_relative 'node'
require 'pry'
class BinarySearchTree

  def initialize
    @head = nil
  end

  def insert(score, title)
    depth = 0
    if @head
      current_node = @head
      # while true
      until can_place(score, title, current_node )
        depth += 1
        # next_node = traverse(score, current_node)
        # if next_node == nil
        #   place_node(score, title, current_node)
        #   return depth
        # elsif next_node == true
        #   current_node.insert_movie(title)
        #   return depth
        # else
        #   current_node = next_node
        # end
        if  score < current_node.score
          current_node = current_node.l_child
        else
          current_node = current_node.r_child
        end
      end
    else
      @head = Node.new(score, title)
      return depth
    end
    depth += 1
    return depth
  end

  def can_place(score, title, node)
    if node.score > score && node.l_child == nil
      node.set_left Node.new(score, title)
      return true
    elsif node.score < score && node.r_child == nil
      node.set_right Node.new(score, title)
      return true
    elsif node.score == score
      node.insert_movie(title)
      return true
    end

    return false
  end

  def traverse(score, node)
    if score < node.score
      return node.l_child
    elsif score > node.score
      return node.r_child
    elsif score == node.score
      return true
    end
  end

  def include?(score)
    current_node = @head
    found = false
    until found
      # binding.pry
      return false if current_node == nil
      if current_node.score > score
        current_node = current_node.l_child
      elsif current_node.score < score
        current_node = current_node.r_child
      elsif current_node.score == score
        return true
      end
    end
  end

  def depth_of(score)
    current_node = @head
    depth = 0
    while true
      return false if current_node == nil
      # p current_node.return_movies, current_node.score
      # p "----"

      if current_node.score > score
        depth +=1
        current_node = current_node.l_child
      elsif current_node.score < score
        depth +=1
        current_node = current_node.r_child
      elsif current_node.score == score
        return depth
      end
    end
  end

  def max
    current_node = @head
    while current_node.r_child != nil
      current_node = current_node.r_child
    end
    return current_node.return_movies[0]
  end

  def min
    current_node = @head
    while current_node.l_child != nil
      current_node = current_node.l_child
    end
    # binding.pry
    return current_node.return_movies[0]
  end

  def sort
    sort_from_node(@head)
  end

  def sort_from_node(node)
    if node == nil
      return []
    else
      return sort_from_node(node.l_child) + node.return_movies + sort_from_node(node.r_child)
    end
  end
end
