class Hamming

  def self.compute(a, b)
    length = [a.length, b.length].min
    (0..length-1).each { |i| if a[i] != b[i]; }.count
  end

end
