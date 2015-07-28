class Triangle
  attr_reader :depth
  def initialize(depth)
    @depth = depth
  end

  def rows
    rows = []
    @depth.times do |i|
      if i == 0
        rows << [1]
      else
        prev = rows[i-1]
        rows << build_inner_array(prev)
      end
    end

    rows
  end

  private

  def build_inner_array(prev)
    count = prev.size + 1
    temp = []
    count.times do |j|
      # beginning and end of triangle always start with 1
      if j == 0 || j == count-1
        temp << 1
      else
        temp << prev[j-1] + prev[j]
      end
    end

    temp
  end

end
