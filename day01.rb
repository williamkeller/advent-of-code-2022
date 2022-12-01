def transform_data(data)
  totals = []

  total = 0
  data.each do |line|
    if line.length == 0
      totals << total
      total = 0
    end

    total += line.to_i
  end

  totals << total

  totals
end

def part_one(data)
  puts data.max
end

def part_two(data)
  puts data.sort.slice(-3, 3).sum
end
