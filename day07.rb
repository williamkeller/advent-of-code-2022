RE_CD_ROOT = /\$ cd \//
RE_CD_UP = /\$ cd \.\./
RE_CD_DOWN = /\$ cd (.*)/
RE_LS = /\$ ls/
RE_DIR = /dir (.*)/
RE_FILE = /(\d*) (.*)/


class Node
  attr_accessor :name, :size, :parent, :children

  def initialize(name, parent)
    @name = name
    @size = 0
    @parent = parent
    @children = []
  end

  def add_child(name)
    child = Node.new(name, self)
    children << child
    child
  end

  def get_child(name)
    children.find { |c| c.name == name }
  end

  def inc_size(size)
    self.size += size
  end

  def total_size
    total = size
    children.each { |c| total += c.total_size }

    total
  end

  def collect(arr)
    children.each { |c| c.collect(arr) }

    arr << self
    arr
  end
end


def build_fs(data)
  fs = Node.new('/', nil)
  node = fs

  data.each do |line|
    case
    when line =~ RE_CD_ROOT
      node = fs

    when line =~ RE_CD_UP
      node = node.parent

    when line =~ RE_DIR
      node.add_child $1

    when line =~ RE_CD_DOWN
      node = node.get_child $1

    when line =~ RE_FILE
      node.inc_size $1.to_i
    end
  end

  fs
end


def part_one(data)

  fs = build_fs data

  arr = fs.collect([])
          .filter { |f| f.total_size <= 100000 }
          .sort_by(&:total_size)

  total = arr.reduce(0) { |sum, node| sum + node.total_size }

  puts "total #{total}"
end


def part_two(data)
  fs = build_fs data

  arr = fs.collect([]).sort_by(&:total_size)

  filesize = 70000000
  freespace = filesize - arr.last.total_size
  needed = 30000000 - freespace

  node = arr.find { |n| n.total_size >= needed }

  puts "#{node.name}, #{node.total_size}"
end
