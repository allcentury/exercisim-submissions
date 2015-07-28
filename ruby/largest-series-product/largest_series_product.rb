class Series
  attr_reader :str
  def initialize(str)
    @str = str
  end

  def largest_product(num)
    return 1 if str.empty?
    raise ArgumentError if num > str.length

    nums = str.split(//).map(&:to_i)

    max = 0
    nums.each_with_index do |_, i|
      product = nums[i..i+num-1].reduce(:*)
      max = product if product > max
    end

    max
  end

end
