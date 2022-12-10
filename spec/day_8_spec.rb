require "day_8"

RSpec.describe Day8 do
  subject { day.solve(part: part) }

  let(:day) { described_class.new(input_file: input_file) }
  let(:input_file) { "spec/fixtures/day8.txt" }
  
  context "part one" do
    let(:part) { 1 }
    it { is_expected.to eq(21) }
  end

  xcontext "part two" do
    let(:part) { 2 }
    it { is_expected.to eq("MCD") }
  end
end