RE_ADDX = /addx (\-?\d*)/
RE_NOOP = /noop/

def part_one(data)
  checkpoints = [20, 60, 100, 140, 180, 220, 260, 300]
  xreg = 1
  next_check = 0
  cur_cycle = 1
  signal_strength = 0

  data.each do |instr|
    case
    when instr =~ RE_ADDX
      if cur_cycle + 2 > checkpoints[next_check]
        strength = checkpoints[next_check] * xreg
        signal_strength += strength
        next_check += 1
      end
      xreg += $1.to_i
      cur_cycle += 2
    when instr =~ RE_NOOP
      cur_cycle += 1
    end
  end

  puts "Signal strength: #{signal_strength}"
end

def draw(screen, cycle, xreg)
  offset = (cycle - 1) % 40
  if ((xreg - 1)..(xreg + 1)).include? offset
    screen[cycle - 1] = '#'
  end
  # puts "cycle: #{cycle}, xreg: #{xreg}, pixel: #{screen[cycle]}, #{offset}"
end

def part_two(data)
  lcd = Array.new(240) { '.' }
  xreg = 1
  cycle = 1

  data.each do |instr|
    case
    when instr =~ RE_ADDX
      draw(lcd, cycle, xreg)
      draw(lcd, cycle + 1, xreg)
      xreg += $1.to_i
      cycle += 2
    when instr =~ RE_NOOP
      draw(lcd, cycle, xreg)
      cycle += 1
    end
  end

  puts lcd.slice(0, 40).join
  puts lcd.slice(40, 40).join
  puts lcd.slice(80, 40).join
  puts lcd.slice(120, 40).join
  puts lcd.slice(160, 40).join
  puts lcd.slice(200, 40).join
end
