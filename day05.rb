RE_PROC = /move (\d*) from (\d*) to (\d*)/
LETTERS = ('A'..'Z').to_a

def part_one(data)
  stacks = Array.new(10) { [] }

  data.each do |line|
    if line.include? '['
      i = 0
      while i < line.length
        c = line[i + 1]

        if LETTERS.include? c
          stacks[(i / 4)].push c
        end

        i += 4
      end
    elsif line.match(RE_PROC)
      num = $1.to_i
      from = $2.to_i - 1
      to = $3.to_i - 1

      num.times do
        v = stacks[from].shift
        stacks[to].unshift v
      end
    end
  end

  output = stacks.map { |s| s[0] }
  puts output.join
end

def part_two(data)
  stacks = Array.new(10) { [] }

  data.each do |line|
    if line.include? '['
      i = 0
      while i < line.length
        c = line[i + 1]

        if LETTERS.include? c
          stacks[(i / 4)].push c
        end

        i += 4
      end
    elsif line.match(RE_PROC)
      num = $1.to_i
      from = $2.to_i - 1
      to = $3.to_i - 1

      tempstack = []
      num.times do
        v = stacks[from].shift
        tempstack.unshift v
      end
      tempstack.each do |c|
        stacks[to].unshift c
      end
    end
  end

  output = stacks.map { |s| s[0] }
  puts output.join
end
