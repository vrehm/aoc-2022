require_relative "./aoc"

class Day2 < AOC
  def solve(part:)
    elves = convert(lazy_load_data)
      .map { |elf| elf.reject { |line| line == "\n" }
      .map { |line| line.gsub("\n", "") }
      .map(&:to_i) }
    calories = elves.map(&:sum).force
    
    case part
    when 1
      calories.max
    else
      calories.max(3).sum
    end
  end

  private

  def convert(data)
    elves = data.slice_when { |line| line == "\n" }
  end
end
