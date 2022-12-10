require "set"

class Day10 < AOC
  @@steps = Set[{cycle_count: 0, accumulator: 1, instruction: "noop"}]

  def solve(part:)
    case part
    when 1
      read_input_file
        .map { |instruction|
          cpu_tick(
            instruction,
            @@steps.to_a.last[:cycle_count],
            @@steps.to_a.last[:accumulator],
            @@steps
          )
        }
      cycle_targets = [20, 60, 100, 140, 180, 220]
      x_targets = cycle_targets.map { |target_cycle| find_cycle(@@steps, target_cycle) }
      cycle_targets.zip(x_targets).map { |x, y| x * y }.sum
    when 2
      draw_crt(read_input_file)
    end
  end

  def cpu_tick(instruction, cycle_count = 0, x = 1, steps = Set.new)
    cycle_count = compute_cycle_count(instruction, cycle_count)
    x = compute_x(instruction, x)
    result = cycle_count.merge(x)
    steps.add(result.merge({instruction: instruction}))
    result
  end

  def compute_cycle_count(instruction, cycle_count = 0)
    cycle_count += /addx -?\d+/.match?(instruction) ? 2 : 1
    {cycle_count: cycle_count}
  end

  def compute_x(instruction, x = 1)
    x += instruction.split.last.to_i
    {accumulator: x}
  end

  def find_cycle(steps_set, target_cycle)
    steps_set.to_a.reverse.find { |step| step[:cycle_count] < target_cycle }[:accumulator]
  end

  def draw_crt(steps)
    i = sum = crt_step = 0
    x = 1
    crt = []
    steps.map do |step|
      (step.match?(/noop/) ? 1 : 2).times do
        i += 1
        sum += i * x if [20, 60, 100, 140, 180, 220].include?(i)
        crt << ([x - 1, x, x + 1].include?(crt_step) ? "#" : ".")
        [40, 80, 120, 160, 200].include?(crt.length) ? crt_step = 0 : crt_step += 1
      end

      x += step.split[1].to_i unless step.match?(/noop/)
    end
    crt.each_slice(40).to_a.each { p _1.join }
  end
end
