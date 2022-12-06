def transform_data(data)
  data.join
end

def part_one(data)
  puts data
  i = 4
  while i < data.length
    marker = data.slice(i - 4, 4)
    if marker.chars.uniq.length == 4
      puts "Found at #{i}"
      break
    end

    i += 1
  end
end

def part_two(data)
  puts data
  i = 14
  while i < data.length
    marker = data.slice(i - 14, 14)
    if marker.chars.uniq.length == 14
      puts "Found at #{i}"
      break
    end

    i += 1
  end
end
