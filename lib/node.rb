class Node
  attr_reader :score, :l_child, :r_child
  def initialize(score, movie)
    @score = score
    @l_child = nil
    @r_child = nil
    @movies = [movie]
  end

  def insert_movie(movie)
    @movies << movie

  end

  def set_left(node)
    @l_child = node
  end

  def set_right(node)
    @r_child = node
  end

  def return_movies
    @movies.map{ |m| {m=>@score} }
  end
end
