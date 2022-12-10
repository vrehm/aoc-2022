RSpec.describe Day3 do
  subject { day.solve(part: part) }

  let(:day) { described_class.new(input_file: input_file) }
  let(:input_file) { "spec/fixtures/day3.txt" }
  let(:part) { 1 }

  context "part one" do
    describe "manipulating the data" do
      it "breaks down the first rucksack into two compartments" do
        data = "vJrwpWtwJgWrhcsFMMfFFhFp"
        expected = {
          compartment1: ["v", "J", "r", "w", "p", "W", "t", "w", "J", "g", "W", "r"],
          compartment2: ["h", "c", "s", "F", "M", "M", "f", "F", "F", "h", "F", "p"]
        }
        expect(day.break_down(data)).to eq(expected)
      end

      it "breaks down the second rucksack into two compartments" do
        data = "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL"
        expected = {
          compartment1: ["j", "q", "H", "R", "N", "q", "R", "j", "q", "z", "j", "G", "D", "L", "G", "L"],
          compartment2: ["r", "s", "F", "M", "f", "F", "Z", "S", "r", "L", "r", "F", "Z", "s", "S", "L"]
        }
        expect(day.break_down(data)).to eq(expected)
      end

      it "breaks down the third rucksack into two compartments" do
        data = "PmmdzqPrVvPwwTWBwg"
        expected = {
          compartment1: ["P", "m", "m", "d", "z", "q", "P", "r", "V"],
          compartment2: ["v", "P", "w", "w", "T", "W", "B", "w", "g"]
        }
        expect(day.break_down(data)).to eq(expected)
      end
    end

    describe "detecting the common letter" do
      it "detects the only letter in common between the two compartments for first rucksack" do
        data = {
          compartment1: ["v", "J", "r", "w", "p", "W", "t", "w", "J", "g", "W", "r"],
          compartment2: ["h", "c", "s", "F", "M", "M", "f", "F", "F", "h", "F", "p"]
        }
        expected = "p"
        expect(day.detect_common_letter(data)).to eq(expected)
      end

      it "detects the only letter in common between the two compartments for second rucksack" do
        data = {
          compartment1: ["j", "q", "H", "R", "N", "q", "R", "j", "q", "z", "j", "G", "D", "L", "G", "L"],
          compartment2: ["r", "s", "F", "M", "f", "F", "Z", "S", "r", "L", "r", "F", "Z", "s", "S", "L"]
        }
        expected = "L"
        expect(day.detect_common_letter(data)).to eq(expected)
      end

      it "detects the only letter in common between the two compartments for third rucksack" do
        data = {
          compartment1: ["P", "m", "m", "d", "z", "q", "P", "r", "V"],
          compartment2: ["v", "P", "w", "w", "T", "W", "B", "w", "g"]
        }
        expected = "P"
        expect(day.detect_common_letter(data)).to eq(expected)
      end
    end

    describe "compute item priority" do
      it "Lowercase item types a through z have priorities 1 through 26" do
        expect(day.compute_item_priority("a")).to eq(1)
        expect(day.compute_item_priority("z")).to eq(26)
      end

      it "Uppercase item types A through Z have priorities 27 through 52" do
        expect(day.compute_item_priority("A")).to eq(27)
        expect(day.compute_item_priority("Z")).to eq(52)
      end

      it "computes the item priority for the first rucksack" do
        data = "p"
        expected = 16
        expect(day.compute_item_priority(data)).to eq(expected)
      end

      it "computes the item priority for the second rucksack" do
        data = "L"
        expected = 38
        expect(day.compute_item_priority(data)).to eq(expected)
      end

      it "computes the item priority for the third rucksack" do
        data = "P"
        expected = 42
        expect(day.compute_item_priority(data)).to eq(expected)
      end
    end

    it { is_expected.to eq(157) }
  end

  context "part two" do
    let(:part) { 2 }

    describe "manipulating the data" do
      it "breaks down the elves into group of 3 rucksacks" do
        data = [
          "vJrwpWtwJgWrhcsFMMfFFhFp",
          "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
          "PmmdzqPrVvPwwTWBwg",
          "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
          "ttgJtRGJQctTZtZT",
          "CrZsJsPPZsGzwwsLwLmpwMDw"
        ]
        expected = [
          ["vJrwpWtwJgWrhcsFMMfFFhFp", "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL", "PmmdzqPrVvPwwTWBwg"],
          ["wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn", "ttgJtRGJQctTZtZT", "CrZsJsPPZsGzwwsLwLmpwMDw"]
        ]
        expect(day.break_down_elves(data)).to eq(expected)
      end
    end

    describe "detect common letters in each group of elves" do
      it "detects the common letters in the first group of elves" do
        data = ["vJrwpWtwJgWrhcsFMMfFFhFp", "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL", "PmmdzqPrVvPwwTWBwg"]
        expected = "r"
        expect(day.detect_group_common_letters(data)).to eq(expected)
      end

      it "detects the common letters in the second group of elves" do
        data = ["wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn", "ttgJtRGJQctTZtZT", "CrZsJsPPZsGzwwsLwLmpwMDw"]
        expected = "Z"
        expect(day.detect_group_common_letters(data)).to eq(expected)
      end
    end

    it { is_expected.to eq(70) }
  end
end
