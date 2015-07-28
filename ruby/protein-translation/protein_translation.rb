class Translation
  def self.of_codon(codon)
    mappings.select { |name, codons| return name if codons.include?(codon) }
  end

  def self.of_rna(strand)
    strand.split(//).each_slice(3).each_with_object([]) do |codon, names|
      name = of_codon(codon.join)

      raise InvalidCodonError if name.empty?

      name == "STOP" ? (return names) : names << name
    end
  end

  def self.mappings
    {
    'Methionine' => %w(AUG),
    'Phenylalanine' => %w(UUU UUC),
    'Leucine' => %w(UUA UUG),
    'Serine' => %w(UCU UCC UCA UCG),
    "Tyrosine" => %w(UAU UAC),
    "Cystine" => %w(UGU UGC),
    'Tryptophan' => %w(UGG),
    "STOP" => %w(UAA UAG UGA)
    }
  end
end
class InvalidCodonError < StandardError; end
