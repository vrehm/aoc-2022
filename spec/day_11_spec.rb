RSpec.describe Day11 do
  subject { day.solve(part: part) }

  let(:day) { described_class.new(input_file: input_file) }
  let(:input_file) { "spec/fixtures/day11.txt" }

  context "part one" do
    let(:part) { 1 }
    it { is_expected.to eq(10605) }
  end

  context "part two" do
    let(:part) { 2 }
    it { is_expected.to eq(2713310158) }
  end
end
