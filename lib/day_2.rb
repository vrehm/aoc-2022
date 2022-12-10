require_relative "./aoc"

class Day2 < AOC
  SCORING1 = {
    "A X": 4, # R R => 1 + 3
    "A Y": 8, # R P => 2 + 6
    "A Z": 3, # R S => 3 + 0
    "B X": 1, # P R => 1 + 0
    "B Y": 5, # P P => 2 + 3
    "B Z": 9, # P S => 3 + 6
    "C X": 7, # S R => 1 + 6
    "C Y": 2, # S P => 2 + 0
    "C Z": 6 # S S => 3 + 3
  }

  SCORING2 = {
    "A X": 3, # S => 3 + 0
    "A Y": 4, # R => 1 + 3
    "A Z": 8, # P => 2 + 6
    "B X": 1, # R => 1 + 0
    "B Y": 5, # P => 2 + 3
    "B Z": 9, # S => 3 + 6
    "C X": 2, # P => 2 + 0
    "C Y": 6, # S => 3 + 3
    "C Z": 7 # R => 1 + 6
  }

  def solve(part:)
    read_input_file
      .map { |round| mark_scoring(round, part) }
      .reduce(:+)
  end

  def mark_scoring(round, scoring = 1)
    (scoring == 1) ? SCORING1[round.to_sym] : SCORING2[round.to_sym]
  end
end
