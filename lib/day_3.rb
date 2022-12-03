require_relative "./aoc"

class Day3 < AOC
  def solve(part:)
    case part
    when 1
      read_input_file
        .map { |rucksack_string| break_down(rucksack_string) }
        .map { |rucksack| detect_common_letter(rucksack) }
        .map { |letter| compute_item_priority(letter) }
        .reduce(&:+)
    else
      break_down_elves(read_input_file)
        .map { |elves_group| detect_group_common_letters(elves_group) }
        .map { |letter| compute_item_priority(letter) }
        .reduce(&:+)
    end
  end

  def break_down(rucksack_string, rucksack = {})
    rucksack_length = rucksack_string.length / 2
    rucksack_string
      .chars
      .each_slice(rucksack_length)
      .with_index { |compartment, index| rucksack["compartment#{index + 1}".to_sym] = compartment }
    rucksack
  end

  def detect_common_letter(rucksack)
    (rucksack[:compartment1] & rucksack[:compartment2]).join
  end

  def detect_group_common_letters(elves)
    elves.map { |elve| elve.chars }.reduce(:&).join
  end

  def compute_item_priority(letter)
    letter_priorities = [("a".."z").to_a, ("A".."Z").to_a].flatten.map.with_index { |letter, index| [letter, index + 1] }.to_h
    letter_priorities[letter]
  end

  def break_down_elves(elves)
    elves.each_slice(3).to_a
  end
end
