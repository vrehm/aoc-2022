require "day_2"

RSpec.describe Day2 do
  subject { day.solve(part: part) }

  let(:day) { described_class.new(input_file: input_file) }
  let(:input_file) { "spec/fixtures/day2.txt" }
  let(:part) { 1 }

  context "part one" do
    it { is_expected.to eq(15) }
  end

  context "part two" do
    let(:part) { 2 }
    xit { is_expected.to eq(45000) }
  end
end
