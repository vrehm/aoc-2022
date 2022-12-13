require "ostruct"

RSpec.describe Day12 do
  subject { day.solve(part: part) }

  let(:day) { described_class.new(input_file: input_file) }
  let(:input_file) { "spec/fixtures/day12.txt" }

  context "part one" do
    let(:part) { 1 }
    let(:test_matrix) {
      [
        [OpenStruct.new({value: "a"}), OpenStruct.new({value: "a"}), OpenStruct.new({value: "b"}), OpenStruct.new({value: "q"}), OpenStruct.new({value: "p"}), OpenStruct.new({value: "o"}), OpenStruct.new({value: "n"}), OpenStruct.new({value: "m"})],
        [OpenStruct.new({value: "a"}), OpenStruct.new({value: "b"}), OpenStruct.new({value: "c"}), OpenStruct.new({value: "r"}), OpenStruct.new({value: "y"}), OpenStruct.new({value: "x"}), OpenStruct.new({value: "x"}), OpenStruct.new({value: "l"})],
        [OpenStruct.new({value: "a"}), OpenStruct.new({value: "c"}), OpenStruct.new({value: "c"}), OpenStruct.new({value: "s"}), OpenStruct.new({value: "z"}), OpenStruct.new({value: "z"}), OpenStruct.new({value: "x"}), OpenStruct.new({value: "k"})],
        [OpenStruct.new({value: "a"}), OpenStruct.new({value: "c"}), OpenStruct.new({value: "c"}), OpenStruct.new({value: "t"}), OpenStruct.new({value: "u"}), OpenStruct.new({value: "v"}), OpenStruct.new({value: "w"}), OpenStruct.new({value: "j"})],
        [OpenStruct.new({value: "a"}), OpenStruct.new({value: "b"}), OpenStruct.new({value: "d"}), OpenStruct.new({value: "e"}), OpenStruct.new({value: "f"}), OpenStruct.new({value: "g"}), OpenStruct.new({value: "h"}), OpenStruct.new({value: "i"})]
      ]
    }

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
      grid = test_matrix
      current_cell = [0, 0]
      expected = [[0, 1], [1, 0]]
      expect(day.orthogonal_neighbors(grid, current_cell)).to eq(expected)
    end

    it "find orthogonal neighbors of E" do
      grid = test_matrix
      current_cell = [5, 2]
      expected = [[4, 2], [5, 3], [6, 2], [5, 1]]
      expect(day.orthogonal_neighbors(grid, current_cell)).to eq(expected)
    end

    it "find orthogonal neighbors of b (1, 1)" do
      grid = test_matrix
      current_cell = [1, 1]
      expected = [[0, 1], [1, 2], [2, 1], [1, 0]]
      expect(day.orthogonal_neighbors(grid, current_cell)).to eq(expected)
    end

    it "find orthogonal neighbors of c (2, 1)" do
      grid = test_matrix
      current_cell = [2, 1]
      expected = [[1, 1], [2, 2], [2, 0]]
      expect(day.orthogonal_neighbors(grid, current_cell)).to eq(expected)
    end
  end

  context "part two" do
    let(:part) { 2 }
    it { is_expected.to eq(29) }

    it "finds all start_locations candidates with 'a' value" do
      data = ["Sabqponm", "abcryxxl", "accszExk", "acctuvwj", "abdefghi"]
      grid = day.build_heightmap(data)
      expected = Set[[0, 0], [1, 0], [0, 1], [0, 2], [0, 3], [0, 4]]
      expect(day.find_all_starting_points(grid)).to eq(expected)
    end
  end
end
