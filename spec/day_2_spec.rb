RSpec.describe Day2 do
  subject { day.solve(part: part) }

  let(:day) { described_class.new(input_file: input_file) }
  let(:input_file) { "spec/fixtures/day2.txt" }
  let(:part) { 1 }

  context "part one" do
    describe "mapping all scoring possibilities while hinting the strategy" do
      it "Rock draws with Rock, R R => 1 + 3" do
        data = "A X"
        expected = 4
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Rock loses to Paper, R P => 2 + 6" do
        data = "A Y"
        expected = 8
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Rock defeats Scissors, R S => 3 + 0" do
        data = "A Z"
        expected = 3
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Paper defeats Rock, P R => 1 + 0" do
        data = "B X"
        expected = 1
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Paper draws with Paper, P P => 2 + 3" do
        data = "B Y"
        expected = 5
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Paper loses to Scissors, P S => 3 + 6" do
        data = "B Z"
        expected = 9
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Scissors loses to Rock, S R => 1 + 6" do
        data = "C X"
        expected = 7
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Scissors defeats Paper, S P => 2 + 0" do
        data = "C Y"
        expected = 2
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Scissors draws with Scissors, S S => 3 + 3" do
        data = "C Z"
        expected = 6
        expect(day.mark_scoring(data, part)).to eq(expected)
      end
    end

    it { is_expected.to eq(15) }
  end

  context "part two" do
    let(:part) { 2 }

    describe "mapping all scoring possibilities with the real strategy" do
      it "Scissors loses to Rock, S => 3 + 0" do
        data = "A X"
        expected = 3
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Rock draws with Rock, R => 1 + 3" do
        data = "A Y"
        expected = 4
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Paper defeats Rock, P => 2 + 6" do
        data = "A Z"
        expected = 8
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Rock loses to Paper, R => 1 + 0" do
        data = "B X"
        expected = 1
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Paper draws with Paper, P => 2 + 3" do
        data = "B Y"
        expected = 5
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Scissors defeats Paper, S => 3 + 6" do
        data = "B Z"
        expected = 9
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Paper loses to Scissors, P => 2 + 0" do
        data = "C X"
        expected = 2
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Scissors draws with Scissors, S => 3 + 3" do
        data = "C Y"
        expected = 6
        expect(day.mark_scoring(data, part)).to eq(expected)
      end

      it "Rock defeats Scissors, R => 1 + 6" do
        data = "C Z"
        expected = 7
        expect(day.mark_scoring(data, part)).to eq(expected)
      end
    end

    it { is_expected.to eq(12) }
  end
end
