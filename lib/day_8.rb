require "matrix"

class Day8 < AOC
  def solve(part:)
    read_input_file
    case part
    when 1
      
    when 2
      
    end
  end

  def build_matrix(data_array)
    Matrix.rows(data_array.map(&:chars).map { |row| row.map(&:to_i) })
  end

  def get_top_adjacent(matrix, target)
    return { top: nil } if target[:y] == 0
    adjacent_y = target[:y] - 1
    top = { x: target[:x], y: adjacent_y, value: matrix[target[:x], adjacent_y] }
    { top: top }
  end

  def count_edges(matrix)
    matrix.row_count * 2 + matrix.column_count * 2 - 4
  end
end
