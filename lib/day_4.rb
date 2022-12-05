require_relative "./aoc"

class Day4 < AOC
  def solve(part:)
    case part
    when 1
      break_down_pairs(read_input_file)
        .then { |elves_pair| create_ranges(elves_pair) }
        .then { |elves_pair_ranges| detect_overlapping_ranges(elves_pair_ranges) }
        .count(true)
    else
      break_down_pairs(read_input_file)
        .then { |elves_pair| create_ranges(elves_pair) }
        .then { |elves_pair_ranges| detect_overlapping_ranges(elves_pair_ranges, part) }
        .count(true)
    end
  end

  def break_down_pairs(elves_pair)
    elves_pair.map { |pair| pair.split(",") }
  end

  def create_ranges(elves_pair)
    elves_pair.map do |pair|
      pair.map do |range|
        range = range.split("-")
        range[0].to_i..range[1].to_i
      end
    end
  end

  def detect_overlapping_ranges(elves_pair_ranges, part = 1)
    case part
    when 1
      elves_pair_ranges.map do |range|
        range[0].cover?(range[1]) || range[1].cover?(range[0])
      end
    else
      elves_pair_ranges.map do |range|
        range[0].overlaps?(range[1])
      end
    end
  end

end

class Range
  def overlaps?(other)
    cover?(other.first) || other.cover?(first)
  end
end