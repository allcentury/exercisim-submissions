class ETL

  def self.transform(hash)
    results = {}
    hash.each { |key, value| value.each { |val| results[val.downcase] = key } }
    results
  end

end
