require 'set'

MOVES = {
  [0, -2] => [0, 1],
  [1, -2] => [-1, 1],
  [2, -2] => [-1, 1],
  [2, -1] => [-1, 1],
  [2, 0] => [-1, 0],
  [2, 1] => [-1, -1],
  [2, 2] => [-1, -1],
  [1, 2] => [-1, -1],
  [0, 2] => [0, -1],
  [-1, 2] => [1, -1],
  [-2, 2] => [1, -1],
  [-2, 1] => [1, -1],
  [-2, 0] => [1, 0],
  [-2, -1] => [1, 1],
  [-2, -2] => [1, 1],
  [-1, -2] => [1, 1]
}

def transform_data(data)
  data.map { |d| d.split(/ /) }
      .map { |d| [d[0], d[1].to_i] }
end

class Knot
  attr_accessor :x, :y
  attr_accessor :connection
  attr_accessor :spots

  def initialize(connection)
    @x = 0
    @y = 0
    @connection = connection
    @spots = Set.new
    @spots << [0, 0]
  end

  def move(dx, dy)
    @x += dx
    @y += dy
  end

  def update_position
    return if connection.nil?

    offset = [x - connection.x, y - connection.y]
    step = MOVES[offset]
    if step
      @x += step[0]
      @y += step[1]
      @spots << [@x, @y]
    end
  end
end


class Rope
  attr_accessor :hx, :hy, :tx, :ty
  attr_accessor :tail_spots

  def initialize
    @hx = 0
    @hy = 0
    @tx = 0
    @ty = 0
    # @tail_spots = Set.new([0, 0])
    @tail_spots = Set.new
    @tail_spots << [0, 0]
  end

  def move(delta_x, delta_y)
    @hx += delta_x
    @hy += delta_y

    offset = [tx - hx, ty - hy]
    step = MOVES[offset]
    if step
      @tx += step[0]
      @ty += step[1]
      tail_spots << [@tx, @ty]
    end
  end

  def to_s
    "Head: #{hx}, #{hy}  Tail: #{tx}, #{ty}"
  end
end


def part_one(data)
  # rope = Rope.new
  head = Knot.new nil
  tail = Knot.new head

  data.each do |cmd|
    case cmd[0]
    when 'U'
      cmd[1].times { head.move(0, -1) ; tail.update_position }
    when 'D'
      cmd[1].times { head.move(0, 1) ; tail.update_position }
    when 'L'
      cmd[1].times { head.move(-1, 0) ; tail.update_position }
    when 'R'
      cmd[1].times { head.move(1, 0) ; tail.update_position }
    end
  end

  puts tail.spots.length
end

def part_two(data)
  knots = []
  10.times { knots << Knot.new(knots.last) }

  data.each do |cmd|
    case cmd[0]
    when 'U'
      cmd[1].times { knots[0].move(0, -1) ; knots.each(&:update_position)}
    when 'D'
      cmd[1].times { knots[0].move(0, 1) ; knots.each(&:update_position) }
    when 'L'
      cmd[1].times { knots[0].move(-1, 0) ; knots.each(&:update_position) }
    when 'R'
      cmd[1].times { knots[0].move(1, 0) ; knots.each(&:update_position) }
    end

  end

  puts knots[9].spots.length
end
