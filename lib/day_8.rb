class Day8 < AOC
  class Tree
    @@visible_trees = 0
    @@scenic_scores = []
    attr_reader :height, :edge
    attr_accessor :right_neighbors, :left_neighbors, :top_neighbors, :bottom_neighbors
    def initialize(args)
      @height = args[:height]
      @edge = args[:edge] || false
      @right_neighbors = []
      @left_neighbors = []
      @top_neighbors = []
      @bottom_neighbors = []
    end

    def visible?
      if @edge
        @@visible_trees += 1
        return true
      end
      if @height > @right_neighbors.max || @height > @left_neighbors.max || @height > @top_neighbors.max || @height > @bottom_neighbors.max
        @@visible_trees += 1
        true
      else
        false
      end
    end

    def compute_scenic_score
      top_score = side_scenic_score(@top_neighbors)
      left_score = side_scenic_score(@left_neighbors)
      bottom_score = side_scenic_score(@bottom_neighbors)
      right_score = side_scenic_score(@right_neighbors)
      @scenic_score = top_score * left_score * bottom_score * right_score
      @@scenic_scores << @scenic_score
    end

    def self.visible_trees
      @@visible_trees
    end

    def self.heighest_score
      @@scenic_scores.max
    end

    private

    def side_scenic_score(neighbors)
      index = neighbors.index { |value| value >= @height }
      index.nil? ? neighbors.size : index + 1
    end
  end

  def solve(part:)
    # input = File.read("data/day8.txt")
    forest = read_input_file.map { |row| row.chars.map(&:to_i) }
    forest_x = forest.first.size
    forest_y = forest.size

    forest_y.times do |row_index|
      row = forest[row_index]

      row.each_with_index do |height, column_index|
        if row_index == 0 || row_index == (forest_y - 1) || column_index == 0 || column_index == (forest_x - 1)
          # outer trees
          tree = Tree.new(height: height, edge: true)
          tree.visible?
        else
          # inner trees
          tree = Tree.new(height: height)
          tree.left_neighbors = row[0...column_index].reverse
          tree.right_neighbors = row[column_index + 1...forest_x]

          turn_90 = forest.transpose
          tree.top_neighbors = turn_90[column_index][0...row_index].reverse
          tree.bottom_neighbors = turn_90[column_index][row_index + 1...forest_y]

          tree.visible?
          tree.compute_scenic_score
        end
      end
    end
    case part
    when 1
      # puts "Part 1 - Visible trees:"
      Tree.visible_trees
    when 2
      # puts "Part 2 - Highest scenic:"
      Tree.heighest_score
    end
  end
end

# require "matrix"

# class Day8 < AOC
#   def solve(part:)
#     read_input_file
#     case part
#     when 1

#     when 2

#     end
#   end

#   def build_matrix(data_array)
#     Matrix.rows(data_array.map(&:chars).map { |row| row.map(&:to_i) })
#   end

#   def get_top_adjacent(matrix, target)
#     return { top: nil } if target[:y] == 0
#     adjacent_y = target[:y] - 1
#     top = { x: target[:x], y: adjacent_y, value: matrix[target[:x], adjacent_y] }
#     { top: top }
#   end

#   def count_edges(matrix)
#     matrix.row_count * 2 + matrix.column_count * 2 - 4
#   end
# end
