
class Forest
  attr_reader :data, :height, :width

  def initialize(data, height, width)
    @height = height
    @width = width

    @data = data.join('').chars.map { |t| [t.to_i, false, 1] }
  end

  def scan_forest
    (0...data.length).each do |i|
      visibilities = [
        look_north(i),
        look_west(i),
        look_south(i),
        look_east(i)
      ]

      if visibilities.find {|v| v == true }
        data[i][1] = true
      end
    end
  end

  def look_north(start)
    line_of_sight = true
    tree_height = data[start][0]
    next_tree = start - width

    distance = 0
    while next_tree >= 0
      distance += 1
      if data[next_tree][0] >= tree_height
        line_of_sight = false
        puts 'breaking'
        break
      end

      puts 'did break get hit?'
      next_tree -= width
      # distance += 1
    end

    data[start][2] *= distance
    line_of_sight
  end

  def look_west(start)
    line_of_sight = true
    tree_height = data[start][0]
    next_tree = start - 1
    edge = (start / width) * width

    # puts "start: #{start}, height: #{tree_height}, edge: #{edge}"
    #
    distance = 0

    while next_tree >= edge
      distance += 1
      # puts "...looking at #{next_tree}, #{data[next_tree][0]}"
      if data[next_tree][0] >= tree_height
        line_of_sight = false
        # puts "...#{tree_height} blocked by #{data[next_tree][0]}"
        break
      end
      next_tree -= 1
      # distance += 1
    end

    data[start][2] *= distance
    line_of_sight
  end


  def look_south(start)
    line_of_sight = true 
    tree_height = data[start][0]
    next_tree = start + width
    distance = 0

    # puts "start: #{start}, height: #{tree_height}"
    while next_tree < data.length
      distance += 1
      # puts "...#{next_tree}"
      if data[next_tree][0] >= tree_height
        line_of_sight = false
        break
      end

      next_tree += width
      # distance += 1
    end

    data[start][2] *= distance
    line_of_sight
  end

  def look_east(start)
    line_of_sight = true
    tree_height = data[start][0]
    next_tree = start + 1
    edge = (start / width * width) + width 

    distance = 0

    while next_tree < edge
      distance += 1
      if data[next_tree][0] >= tree_height
        line_of_sight = false
        break
      end

      next_tree += 1
      # distance += 1
    end

    data[start][2] *= distance
    line_of_sight
  end

end


def transform_data(data)
  data = data.map(&:chomp)
  width = data[0].length
  height = data.length

  Forest.new(data, height, width)
end

def part_one(forest)
  forest.scan_forest

  # (0...forest.height).each do |y|
  #   # puts forest.data.slice(y * forest.width, forest.width).inspect
  # end
  # puts
  visible = forest.data.filter { |t| t[1] == true }
  # puts visible.inspect
  puts visible.length
end

def part_two(forest)
  forest.scan_forest

  (0...forest.height).each do |y|
    puts forest.data.slice(y * forest.width, forest.width).inspect
  end
  distances = forest.data.map { |t| t[2] }.sort
  puts distances.inspect
end
