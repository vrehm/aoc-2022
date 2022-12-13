class Day11
  def initialize(input_file:)
    @input_file = input_file
  end

  def read_input_file
    IO.read(@input_file).split("\n\n")
  end

  def solve(part:)
    case part
    when 1
      part = {rounds: 20, div: 3}
    when 2
      part = {rounds: 10_000, div: 1}
    end

    monkeys = read_input_file.map do |monkey|
      monkey = monkey.split("\n")

      {
        items: monkey[1].scan(/\d+/).map(&:to_i),
        oper: monkey[2].scan(/[+*]/).first.to_sym,
        param: monkey[2].scan(/\d+$/).map(&:to_i).first,
        test: monkey[3].scan(/\d+$/).first.to_i,
        pass: monkey[4].scan(/\d+$/).first.to_i,
        fail: monkey[5].scan(/\d+$/).first.to_i,
        inspections: 0
      }
    end

    lcm = monkeys.map { |i| i[:test] }.reduce(:lcm)

    part[:rounds].times.each do
      monkeys.each do |monkey|
        monkey[:inspections] += monkey[:items].size

        while (i = monkey[:items].shift)
          param = monkey[:param] || i
          i = (i.method(monkey[:oper]).call(param) / part[:div]) % lcm

          target = (i % monkey[:test]).zero? ? monkey[:pass] : monkey[:fail]
          monkeys[target][:items] << i
        end
      end
    end

    monkeys.map { |i| i[:inspections] }.max(2).reduce(:*)
  end
end
