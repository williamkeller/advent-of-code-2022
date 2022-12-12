RE_MONKEY = /Monkey (\d*):/
RE_ITEMS = /Starting items:/
RE_OP = /Operation: new = old ([\*\+]{1}) (\d+|old)/
RE_TEST = /Test: divisible by (\d+)/
RE_TRUE = /If true: throw to monkey (\d+)/
RE_FALSE = /If false: throw to monkey (\d+)/

class Monkey
  attr_accessor :items
  attr_accessor :operand, :amount
  attr_accessor :test_amount
  attr_accessor :true_dest, :false_dest
  attr_accessor :inspect_count
  attr_accessor :worry
  attr_accessor :restrictor

  def initialize
    @worry = true
    @inspect_count = 0
    @restrictor = nil
  end

  def add_item(item)
    if restrictor
      item = item % restrictor
    end
    items.push item
  end

  def turn
    items.each do |item|
      self.inspect_count += 1
      arg = (amount == :old) ? item : amount
      if operand == '*'
        item *= arg
      elsif operand == '+'
        item += arg
      else
        raise "unexpected operand: #{operand}"
      end

      if worry
        item /= 3
      end

      if item % test_amount != 0
        yield item, false_dest
      else
        yield item, true_dest
      end
    end

    self.items = []
  end
end


def parse_monkey_file(data)
  monkeys = []
  cur_monkey = nil

  data.each do |line|
    case
    when line =~ RE_MONKEY
      cur_monkey = Monkey.new
      monkeys << cur_monkey

    when line =~ RE_ITEMS
      items = $'.split(/,/).map(&:to_i)
      cur_monkey.items = items

    when line =~ RE_OP
      cur_monkey.operand = $1
      if $2 == 'old'
        cur_monkey.amount = :old
      else
        cur_monkey.amount = $2.to_i
      end

    when line =~ RE_TEST
      cur_monkey.test_amount = $1.to_i

    when line =~ RE_TRUE
      cur_monkey.true_dest = $1.to_i

    when line =~ RE_FALSE
      cur_monkey.false_dest = $1.to_i

    when line.match(/\s*/)
      # blank line, do nothing
    else
      raise "unparsed line! \n#{line}"
    end

    @items = []
  end

  monkeys
end

def part_one(data)
  monkeys = parse_monkey_file(data)

  (0...20).each do |turn|
    monkeys.each do |monkey|
      monkey.turn do |item, dest|
        monkeys[dest].add_item item
      end
    end
  end

  total = monkeys.map(&:inspect_count).sort.reverse.slice(0, 2).reduce(&:*)

  puts total

end

def part_two(data)
  monkeys = parse_monkey_file(data)
  monkeys.each { |m| m.worry = false }

  restrictor = monkeys.map(&:test_amount).reduce(&:*)
  monkeys.each { |m| m.restrictor = restrictor }

  puts "restrictor = #{restrictor}"

  (0...10000).each do |turn|
    monkeys.each do |monkey|
      monkey.turn do |item, dest|
        monkeys[dest].add_item item
      end
    end
  end



  counts = monkeys.map(&:inspect_count).sort.reverse
  puts counts.join(',')
  puts monkeys.map(&:inspect_count).sort.reverse.slice(0, 2).reduce(&:*)

end
