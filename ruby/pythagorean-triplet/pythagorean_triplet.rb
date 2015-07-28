class Triplet
  attr_reader :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def sum
    [a, b, c].reduce(:+)
  end

  def product
    [a, b, c].reduce(:*)
  end

  def pythagorean?
    a ** 2 + b ** 2 == c ** 2
  end

  def self.where(min_factor: 1, max_factor: nil, sum: nil)
    (min_factor..max_factor).each_with_object([]) do |a, triplets|
      (min_factor..a).each do |b|
        (b..max_factor).each do |c|
          triplet = Triplet.new(a, b, c)
          triplets << triplet if confirmed_set?(triplet, sum)
        end
      end
    end # return triples
  end

  private

  def self.confirmed_set?(triplet, sum)
    triplet.pythagorean? && (triplet.sum == sum || sum.nil?)
  end

end
