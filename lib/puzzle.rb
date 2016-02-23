class Puzzle
  attr_reader :puzzle_vals

  def initialize(puzzle_file)
    @puzzle_file = puzzle_file
    self.consume
  end

  def consume
    @puzzle_vals = @puzzle_file.scan(/\d/).map {|i| i.to_i }
  end

  def incomplete
    @puzzle_vals.include? 0
  end

  def groupings
    ret = []
    ret << row_groups
    ret << col_groups
    ret << gridlets
  end
  
  def row_groups
    @puzzle_vals.each_slice(9).to_a
  end
  
  def col_groups
    @puzzle_vals.each_slice(9).to_a.transpose
  end

  def gridlets
    return_set = Array.new(9){ Array.new(0) }
    @puzzle_vals.each_with_index do |e, i|
      return_set[(i/27*3 + i%9/3)] << e
    end
    return_set
  end
end
