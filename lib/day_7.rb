require "pathname"
class Day7 < AOC
  def solve(part:)
    sizes = Hash.new(0)
    path = Pathname.new("/")
    read_input_file.map do |line|
      if line =~ /\$ cd (.+)/
        path = path.join($1)
      elsif line =~ /^(\d+)/
        path.ascend { sizes[_1.to_s] += $1.to_i }
      end
    end

    case part
    when 1
      sizes.values.select { _1 <= 100_000 }.sum
    when 2
      sizes.values.sort.find { _1 >= 30_000_000 - 70_000_000 + sizes["/"] }
    end
  end
end
