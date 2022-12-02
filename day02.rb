HANDS = {
  'A' => { 'X' => 4, 'Y' => 8, 'Z' => 3 },
  'B' => { 'X' => 1, 'Y' => 5, 'Z' => 9 },
  'C' => { 'X' => 7, 'Y' => 2, 'Z' => 6 }
}

RULES = {
  'A' => { 'X' => 'Z', 'Y' => 'X', 'Z' => 'Y' },
  'B' => { 'X' => 'X', 'Y' => 'Y', 'Z' => 'Z' },
  'C' => { 'X' => 'Y', 'Y' => 'Z', 'Z' => 'X' }
}


def transform_data(data)
  data.map { |line| line.split(/ /) }
end


def part_one(data)
  scores = data.map do |hand|
    HANDS[hand[0]][hand[1]]
  end

  puts scores.sum
end


def part_two(data)
  hands = data.map do |hand|
    [hand[0], RULES[hand[0]][hand[1]]]
  end

  scores = hands.map do |hand|
    HANDS[hand[0]][hand[1]]
  end

  puts scores.sum
end
