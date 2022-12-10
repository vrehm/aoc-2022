require_relative "./aoc"

class Day5 < AOC
  def solve(part:)
    input = File.open("data/day5.txt").read
    # get the initial stacks and instructions

    i_stacks = input.split(/\n\n/).first
    instructions = input.split(/\n\n/).last

    # beautify instructions
    instructions = instructions.split(/\n/).map do |text|
      first_number = text.match(/e \d+/)[0].gsub("e ", "").to_i
      second_number = text.match(/\d t/)[0].gsub(" t", "").to_i
      third_number = text.match(/o \d/)[0].gsub("o ", "").to_i
      [first_number, second_number, third_number]
    end

    instructions = instructions.map do |i|
      {quantity: i.first.to_i, o_stack: i[1].to_i, e_stack: i.last.to_i}
    end

    # beautify stacks
    rows = i_stacks.split(/\n/)
    rows.delete_at(-1)

    rows = rows.map do |row|
      final_row = []
      characters = row.split("")
      characters.each_slice(4) {|slice| final_row << slice}
      final_row.map { |column| column.join.gsub(/[\[\] ]/, "")  }
    end

    rows = rows.transpose.map(&:reverse)
    rows.each {|row| row.delete("")}

    stacks = {}
    rows.each_with_index do |row, index|
      stacks[index+1] = row
    end

    # do the moving

    instructions.each do |ins|
      range = ((-(ins[:quantity]))..-1)
      case part
      when 1
        # remove .reverse for the second part
        to_add = stacks[ins[:o_stack]].slice!(range).reverse
      else
        to_add = stacks[ins[:o_stack]].slice!(range)
      end
      destination = stacks[ins[:e_stack]]
      destination.push(to_add).flatten!
    end

    result = stacks.map { |k,v| v.last  }.join
    p result
  end
end