RSpec.describe Day4 do
  subject { day.solve(part: part) }

  let(:day) { described_class.new(input_file: input_file) }
  let(:input_file) { "spec/fixtures/day4.txt" }
  let(:part) { 1 }

  context "part one" do
    describe "manipulating the data" do
      it "breaks down the pair of elves" do
        data = ["2-4,6-8", "2-3,4-5", "5-7,7-9", "2-8,3-7", "6-6,4-6", "2-6,4-8"]
        expected = [["2-4", "6-8"], ["2-3", "4-5"], ["5-7", "7-9"], ["2-8", "3-7"], ["6-6", "4-6"], ["2-6", "4-8"]]
        expect(day.break_down_pairs(data)).to eq(expected)
      end

      it "creates the ranges for every pair of elves" do
        data = [["2-4", "6-8"], ["2-3", "4-5"], ["5-7", "7-9"], ["2-8", "3-7"], ["6-6", "4-6"], ["2-6", "4-8"]]
        expected = [
          [2..4, 6..8],
          [2..3, 4..5],
          [5..7, 7..9],
          [2..8, 3..7],
          [6..6, 4..6],
          [2..6, 4..8]
        ]
        expect(day.create_ranges(data)).to eq(expected)
      end

      it "detects when ranges are overlapping" do
        data = [
          [2..4, 6..8],
          [2..3, 4..5],
          [5..7, 7..9],
          [2..8, 3..7],
          [6..6, 4..6],
          [2..6, 4..8]
        ]
        expected = [
          false,
          false,
          false,
          true,
          true,
          false
        ]
        expect(day.detect_overlapping_ranges(data)).to eq(expected)
      end
    end

    it { is_expected.to eq(2) }
  end

  context "part two" do
    let(:part) { 2 }

    it "detects when ranges are overlapping at all" do
      data = [
        [2..4, 6..8],
        [2..3, 4..5],
        [5..7, 7..9],
        [2..8, 3..7],
        [6..6, 4..6],
        [2..6, 4..8]
      ]
      expected = [
        false,
        false,
        true,
        true,
        true,
        true
      ]
      expect(day.detect_overlapping_ranges(data, part)).to eq(expected)
    end

    it { is_expected.to eq(4) }
  end
end
