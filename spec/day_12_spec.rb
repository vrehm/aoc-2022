RSpec.describe Day12 do
  subject { day.solve(part: part) }

  let(:day) { described_class.new(input_file: input_file) }
  let(:input_file) { "spec/fixtures/day12.txt" }

  context "part one" do
    let(:part) { 1 }
    it { is_expected.to eq(31) }

    it "builds the heightmap like a 2D grid" do
      data = ["Sabqponm", "abcryxxl", "accszExk", "acctuvwj", "abdefghi"]
      expected = [
        ["S", "a", "b", "q", "p", "o", "n", "m"],
        ["a", "b", "c", "r", "y", "x", "x", "l"],
        ["a", "c", "c", "s", "z", "E", "x", "k"],
        ["a", "c", "c", "t", "u", "v", "w", "j"],
        ["a", "b", "d", "e", "f", "g", "h", "i"]
      ]
      expect(day.build_heightmap(data)).to eq(expected)
    end

    it "detects the start coordinates of S" do
      data = [
        ["S", "a", "b", "q", "p", "o", "n", "m"],
        ["a", "b", "c", "r", "y", "x", "x", "l"],
        ["a", "c", "c", "s", "z", "E", "x", "k"],
        ["a", "c", "c", "t", "u", "v", "w", "j"],
        ["a", "b", "d", "e", "f", "g", "h", "i"]
      ]
      expected = [0, 0]
      expect(day.find_coordinates(data, "S")).to eq(expected)
    end

    it "detects the end coordinates of E" do
      data = [
        ["S", "a", "b", "q", "p", "o", "n", "m"],
        ["a", "b", "c", "r", "y", "x", "x", "l"],
        ["a", "c", "c", "s", "z", "E", "x", "k"],
        ["a", "c", "c", "t", "u", "v", "w", "j"],
        ["a", "b", "d", "e", "f", "g", "h", "i"]
      ]
      expected = [5, 2]
      expect(day.find_coordinates(data, "E")).to eq(expected)
    end

    it "find orthogonal neighbors of S" do
      grid = [
        ["S", "a", "b", "q", "p", "o", "n", "m"],
        ["a", "b", "c", "r", "y", "x", "x", "l"],
        ["a", "c", "c", "s", "z", "E", "x", "k"],
        ["a", "c", "c", "t", "u", "v", "w", "j"],
        ["a", "b", "d", "e", "f", "g", "h", "i"]
      ]
      current_cell = [0, 0]
      expected = [[0, 1], [1, 0]]
      expect(day.orthogonal_neighbors(grid, current_cell)).to eq(expected)
    end

    it "find orthogonal neighbors of E" do
      grid = [
        ["S", "a", "b", "q", "p", "o", "n", "m"],
        ["a", "b", "c", "r", "y", "x", "x", "l"],
        ["a", "c", "c", "s", "z", "E", "x", "k"],
        ["a", "c", "c", "t", "u", "v", "w", "j"],
        ["a", "b", "d", "e", "f", "g", "h", "i"]
      ]
      current_cell = [5, 2]
      expected = [[4, 2], [5, 3], [6, 2], [5, 1]]
      expect(day.orthogonal_neighbors(grid, current_cell)).to eq(expected)
    end

    it "find orthogonal neighbors of b (1, 1)" do
      grid = [
        ["S", "a", "b", "q", "p", "o", "n", "m"],
        ["a", "b", "c", "r", "y", "x", "x", "l"],
        ["a", "c", "c", "s", "z", "E", "x", "k"],
        ["a", "c", "c", "t", "u", "v", "w", "j"],
        ["a", "b", "d", "e", "f", "g", "h", "i"]
      ]
      current_cell = [1, 1]
      expected = [[0, 1], [1, 2], [2, 1], [1, 0]]
      expect(day.orthogonal_neighbors(grid, current_cell)).to eq(expected)
    end

    it "find orthogonal neighbors of c (2, 1)" do
      grid = [
        ["S", "a", "b", "q", "p", "o", "n", "m"],
        ["a", "b", "c", "r", "y", "x", "x", "l"],
        ["a", "c", "c", "s", "z", "E", "x", "k"],
        ["a", "c", "c", "t", "u", "v", "w", "j"],
        ["a", "b", "d", "e", "f", "g", "h", "i"]
      ]
      current_cell = [2, 1]
      expected = [[1, 1], [2, 2], [2, 0]]
      expect(day.orthogonal_neighbors(grid, current_cell)).to eq(expected)
    end
  end

  context "part two" do
    let(:part) { 2 }
    it { is_expected.to eq(29) }
  end
end
