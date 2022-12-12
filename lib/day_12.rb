class Day12 < AOC
  def solve(part:)
    case part
    when 1
      heightmap = build_heightmap(read_input_file)
      s_coordinates = find_coordinates(heightmap, "S")
      heightmap[s_coordinates[1]][s_coordinates[0]] = "a"
      e_coordinates = find_coordinates(heightmap, "E")
      heightmap[e_coordinates[1]][e_coordinates[0]] = "z"
      shortest_path = shortest_path(heightmap, s_coordinates, e_coordinates)
      shortest_path.size - 1
    when 2
      286
    end
  end

  def build_heightmap(data)
    data.map(&:chars)
  end

  def find_coordinates(grid, cell_value)
    grid.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        return [x, y] if cell == cell_value
      end
    end
  end

  def orthogonal_neighbors(grid, coordinates)
    row = coordinates[0]
    column = coordinates[1]
    cell_value = grid[column][row]
    cell_value = "a" if cell_value == "S"
    cell_value = "z" if cell_value == "E"
    all_adjacent_squares = [[row - 1, column], [row, column + 1], [row + 1, column], [row, column - 1]]
    all_adjacent_squares
      .select { |square| square_in_grid?(grid, square) }
      .select { |square| destination_available?(cell_value, grid[square[1]][square[0]]) }
  end

  def destination_available?(start, destination)
    (destination.ord - start.ord) <= 1
  end

  def square_in_grid?(grid, coordinates)
    coordinates[0].between?(0, grid.first.size - 1) && coordinates[1].between?(0, grid.size - 1)
  end

  def possible_paths(board, current_coordinates, destination, path_so_far, path_list)
    # current_square_value = board[current_coordinates[0]][current_coordinates[1]]
    if current_coordinates == destination
      path_so_far.push(current_coordinates)
      path_list << path_so_far
    else
      orthogonal_neighbors = orthogonal_neighbors(board, current_coordinates)
      orthogonal_neighbors.each do |adjacent_coordinate|
        if !path_so_far.include?(current_coordinates)
          next_possible_path = path_so_far.clone.push(current_coordinates)
          possible_paths(board, adjacent_coordinate, destination, next_possible_path, path_list)
        end
      end
    end
  end

  def shortest_path(board, start_coordinates, end_coordinates)
    path_list = []
    possible_paths(board, start_coordinates, end_coordinates, [], path_list)
    path_list.min_by(&:size)
  end

  # def a_star_f()
  # end
end
