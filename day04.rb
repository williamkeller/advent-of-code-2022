def transform_data(data)
  data.map do |line|
    assignments = line.split(/,/)
    [assignments[0].split(/\-/), assignments[1].split(/\-/)]
  end
end

def part_one(data)
  count = 0

  data.each do |assignment|
    ids1 = (assignment[0][0]..assignment[0][1]).to_a
    ids2 = (assignment[1][0]..assignment[1][1]).to_a

    shortest = [ids1.length, ids2.length].min

    if ids1.intersection(ids2).length == shortest
      count += 1
    end
  end

  puts "Count #{count}"
end

def part_two(data)
  count = 0

  data.each do |assignment|
    ids1 = (assignment[0][0]..assignment[0][1]).to_a
    ids2 = (assignment[1][0]..assignment[1][1]).to_a

    if ids1.intersection(ids2).length > 0
      count += 1
    end
  end

  puts "Count #{count}"
end

