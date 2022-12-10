require "day_8"

RSpec.describe Day8 do
  subject { day.solve(part: part) }

  let(:day) { described_class.new(input_file: input_file) }
  let(:input_file) { "spec/fixtures/day8.txt" }
  let(:part) { 1 }

  context "part one" do
    it { is_expected.to eq(21) }
  end

  xcontext "part one" do
    it "creates a 1 x 5 grid of trees with x,y position from numbers" do
      data = ["30373"]
      expected = Matrix[[3, 0, 3, 7, 3]]
      expect(day.build_matrix(data)).to eq(expected)
    end

    it "creates a 2 x 5 grid of trees with x,y position from numbers" do
      data = ["30373", "25512"]
      expected = Matrix[
        [3, 0, 3, 7, 3],
        [2, 5, 5, 1, 2]
      ]
      expect(day.build_matrix(data)).to eq(expected)
    end

    it "creates a 5 x 5 grid of trees with x,y position from numbers" do
      data = ["30373", "25512", "65332", "33549", "35390"]
      expected = Matrix[
        [3, 0, 3, 7, 3],
        [2, 5, 5, 1, 2],
        [6, 5, 3, 3, 2],
        [3, 3, 5, 4, 9],
        [3, 5, 3, 9, 0]
      ]
      expect(day.build_matrix(data)).to eq(expected)
    end

    it "gets the top adjacent tree for { x: 3, y: 3, value: 3 }" do
      data = Matrix[
        [3, 0, 3, 7, 3],
        [2, 5, 5, 1, 2],
        [6, 5, 3, 3, 2],
        [3, 3, 5, 4, 9],
        [3, 5, 3, 9, 0]
      ]
      target = {x: 3, y: 3, value: 3}
      expected = {top: {x: 3, y: 2, value: 5}}
      expect(day.get_top_adjacent(data, target)).to eq(expected)
    end

    it "count the edges of the matrix" do
      data = Matrix[
        [3, 0, 3, 7, 3],
        [2, 5, 5, 1, 2],
        [6, 5, 3, 3, 2],
        [3, 3, 5, 4, 9],
        [3, 5, 3, 9, 0]
      ]
      expected = 16
      expect(day.count_edges(data)).to eq(expected)
    end

    it "detects if a target is at the edge of the matrix" do
      data = Matrix[
        [3, 0, 3, 7, 3],
        [2, 5, 5, 1, 2],
        [6, 5, 3, 3, 2],
        [3, 3, 5, 4, 9],
        [3, 5, 3, 9, 0]
      ]
      target1 = {x: 3, y: 3, value: 3}
      target2 = {x: 0, y: 0, value: 3}
      target3 = {x: 1, y: 0, value: 0}
      target4 = {x: 2, y: 0, value: 3}
      target5 = {x: 3, y: 0, value: 7}
      target6 = {x: 4, y: 0, value: 3}
      target7 = {x: 4, y: 1, value: 2}
      target8 = {x: 4, y: 2, value: 2}
      target9 = {x: 4, y: 3, value: 9}
      target10 = {x: 4, y: 4, value: 0}
      target11 = {x: 3, y: 4, value: 9}
      target12 = {x: 2, y: 4, value: 3}
      target13 = {x: 1, y: 4, value: 5}
      target14 = {x: 0, y: 4, value: 3}

      expect(day.at_edge?(data, target1)).to eq(false)
      expect(day.at_edge?(data, target2)).to eq(true)
      expect(day.at_edge?(data, target3)).to eq(true)
    end

    it "gets the top adjacent tree for { x: 0, y: 0, value: 3 }" do
      data = Matrix[
        [3, 0, 3, 7, 3],
        [2, 5, 5, 1, 2],
        [6, 5, 3, 3, 2],
        [3, 3, 5, 4, 9],
        [3, 5, 3, 9, 0]
      ]
      target = {x: 0, y: 0, value: 3}
      expected = {top: nil}
      expect(day.get_top_adjacent(data, target)).to eq(expected)
    end
  end

  context "part two" do
    let(:part) { 2 }

    it { is_expected.to eq(8) }
  end
end
