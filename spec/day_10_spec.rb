RSpec.describe Day10 do
  subject { day.solve(part: part) }

  let(:day) { described_class.new(input_file: input_file) }
  let(:input_file) { "spec/fixtures/day10b.txt" }

  context "part one" do
    let(:part) { 1 }
    it { is_expected.to eq(13140) }

    it "addx V takes two cycles to complete" do
      data = "addx 3"
      expected = {cycle_count: 2}
      expect(day.compute_cycle_count(data)).to eq(expected)
    end

    it "noop takes one cycle to complete" do
      data = "noop"
      expected = {cycle_count: 1}
      expect(day.compute_cycle_count(data)).to eq(expected)
    end

    it "addx V adds the value of V to the accumulator and takes 2 cycles to complete" do
      data = "addx 3"
      expected = {cycle_count: 2, accumulator: 4}
      expect(day.cpu_tick(data)).to eq(expected)
    end

    it "addx V adds the value of V (negative) to the accumulator and takes 2 cycles to complete" do
      data = "addx -3"
      expected = {cycle_count: 2, accumulator: -2}
      expect(day.cpu_tick(data)).to eq(expected)
    end

    context "it redo the small example" do
      it "noop step 1" do
        data = "noop"
        expected = {cycle_count: 1, accumulator: 1}
        expect(day.cpu_tick(data)).to eq(expected)
      end

      it "addx 3 step 2" do
        data = "addx 3"
        x = 1
        cycle_count = 1
        expected = {cycle_count: 3, accumulator: 4}
        expect(day.cpu_tick(data, cycle_count, x)).to eq(expected)
      end

      it "addx -5 step 3" do
        data = "addx -5"
        x = 4
        cycle_count = 3
        expected = {cycle_count: 5, accumulator: -1}
        expect(day.cpu_tick(data, cycle_count, x)).to eq(expected)
      end
    end
  end

  context "part two" do
    let(:part) { 2 }
    expected = [
      ["#", "#", ".", ".", "#", "#", ".", ".", "#", "#", ".", ".", "#", "#", ".", ".", "#", "#", ".", ".", "#", "#", ".", ".", "#", "#", ".", ".", "#", "#", ".", ".", "#", "#", ".", ".", "#", "#", ".", "."],
      ["#", "#", "#", ".", ".", ".", "#", "#", "#", ".", ".", ".", "#", "#", "#", ".", ".", ".", "#", "#", "#", ".", ".", ".", "#", "#", "#", ".", ".", ".", "#", "#", "#", ".", ".", ".", "#", "#", "#", "."],
      ["#", "#", "#", "#", ".", ".", ".", ".", "#", "#", "#", "#", ".", ".", ".", ".", "#", "#", "#", "#", ".", ".", ".", ".", "#", "#", "#", "#", ".", ".", ".", ".", "#", "#", "#", "#", ".", ".", ".", "."],
      ["#", "#", "#", "#", "#", ".", ".", ".", ".", ".", "#", "#", "#", "#", "#", ".", ".", ".", ".", ".", "#", "#", "#", "#", "#", ".", ".", ".", ".", ".", "#", "#", "#", "#", "#", ".", ".", ".", ".", "."],
      ["#", "#", "#", "#", "#", "#", ".", ".", ".", ".", ".", ".", "#", "#", "#", "#", "#", "#", ".", ".", ".", ".", ".", ".", "#", "#", "#", "#", "#", "#", ".", ".", ".", ".", ".", ".", "#", "#", "#", "#"],
      ["#", "#", "#", "#", "#", "#", "#", ".", ".", ".", ".", ".", ".", ".", "#", "#", "#", "#", "#", "#", "#", ".", ".", ".", ".", ".", ".", ".", "#", "#", "#", "#", "#", "#", "#", ".", ".", ".", ".", "."]
    ]
    it { is_expected.to eq(expected) }
  end
end
