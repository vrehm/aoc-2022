require "gastar"
require "set"

class Tile < AStarNode
  attr_reader :x, :y, :value, :h, :seen

  def initialize(x, y, value, h, seen = false)
    super()
    @x, @y, @value, @h, @seen = x, y, value, h, seen
  end

  def seen?
    @seen
  end

  def move_cost(other) = 1

  def to_s = value
end

class Space < AStar
  def heuristic(node, start, goal)
    (start.x - goal.x).abs + (start.y - goal.y).abs
  end
end

class Day12 < AOC
  def solve(part:)
    heightmap = build_heightmap(read_input_file)

    s_coordinates = find_coordinates(heightmap, "S")
    s_x, s_y = s_coordinates[0], s_coordinates[1]
    heightmap[s_y][s_x] = "a"

    e_coordinates = find_coordinates(heightmap, "E")
    e_x, e_y = e_coordinates[0], e_coordinates[1]
    heightmap[e_y][e_x] = "z"

    case part
    when 1
      tiles, matrix = build_tiles(heightmap)
      nodes = tiles.map { |tile| orthogonal_neighbors(matrix, [tile.x, tile.y]).map { |x, y| matrix[y][x] } }
      tiles_hash = tiles.zip(nodes).to_h

      start = matrix[s_y][s_x]
      goal = matrix[e_y][e_x]

      space = Space.new(tiles_hash)
      space.search(start, goal).size - 1
    when 2
      start_locations = find_all_starting_points(heightmap)
      paths = Set.new
      start_locations.map do |x, y|
        tiles, matrix = build_tiles(heightmap)
        nodes = tiles.map { |tile| orthogonal_neighbors(matrix, [tile.x, tile.y]).map { |x, y| matrix[y][x] } }
        tiles_hash = tiles.zip(nodes).to_h

        start = matrix[y][x]
        goal = matrix[e_y][e_x]

        space = Space.new(tiles_hash)
        result = space.search(start, goal)
        paths << result.size - 1 if result
      end
      paths.min
    end
  end

  def build_tiles(heightmap)
    tiles = Set.new
    n, m = heightmap.size, heightmap.first.size
    matrix = Array.new(n) { Array.new(m) { nil } }
    heightmap.each_with_index do |row, y_index|
      row.each_with_index do |cell_value, x_index|
        tile = Tile.new(x_index, y_index, cell_value, cell_value.ord)
        tiles << tile
        matrix[y_index][x_index] = tile
      end
    end
    [tiles, matrix]
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

  def find_all_starting_points(grid)
    results = Set.new
    grid.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        results << [x, y] if cell == "a" || cell == "S"
      end
    end
    results
  end

  def orthogonal_neighbors(grid, coordinates)
    row = coordinates[0]
    column = coordinates[1]
    cell_value = grid[column][row]&.value
    cell_value = "a" if cell_value == "S"
    cell_value = "z" if cell_value == "E"
    all_adjacent_squares = [[row - 1, column], [row, column + 1], [row + 1, column], [row, column - 1]]
    all_adjacent_squares
      .select { |square| square_in_grid?(grid, square) }
      .select { |x, y| destination_available?(cell_value, grid[y][x]&.value) }
  end

  def destination_available?(start_letter, destination_letter)
    (destination_letter.ord - start_letter.ord) <= 1
  end

  def square_in_grid?(grid, coordinates)
    coordinates[0].between?(0, grid.first.size - 1) && coordinates[1].between?(0, grid.size - 1)
  end
end
