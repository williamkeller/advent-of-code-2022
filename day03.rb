def part_one(data)
  total = 0

  data.each do |line|
    half_len = line.length / 2
    c1 = line.slice(0, half_len).chars
    c2 = line.slice(half_len, half_len).chars

    common = c1.intersection(c2)

    ord = common[0].ord

    case ord
    when 97..122
      total += ord - 96
    when 65..90
      total += ord - 64 + 26
    else
      raise "could not match up #{common}"
    end
  end

  puts "total #{total}"
end

def part_two(data)
  total = 0

  data.each_slice(3) do |line1, line2, line3|
    arr1 = line1.chars
    arr2 = line2.chars
    arr3 = line3.chars

    common1 = arr1.intersection(arr2)
    common2 = common1.intersection(arr3)

    ord = common2[0].ord

    case ord
    when 97..122
      total += ord - 96
    when 65..90
      total += ord - 64 + 26
    else
      raise "could not match up #{common}"
    end
  end

  puts "total #{total}"
end
