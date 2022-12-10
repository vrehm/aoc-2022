RSpec.describe Day7 do
  subject { day.solve(part: part) }

  let(:day) { described_class.new(input_file: input_file) }
  let(:input_file) { "spec/fixtures/day7.txt" }
  let(:part) { 1 }

  context "part one with first example" do
    it { is_expected.to eq(95437) }
  end

  context "part two" do
    let(:part) { 2 }

    it { is_expected.to eq(24933642) }
  end
end
