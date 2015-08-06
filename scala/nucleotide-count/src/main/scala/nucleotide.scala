class DNA(strand: String) {
  require(!strand.contains("U") && strand == strand.toUpperCase)

  def count(el: Char): Int = {
    if (nucleotideCounts.contains(el)) {
      return nucleotideCounts(el)
    } else {
      throw new IllegalArgumentException
    }
  }

  def nucleotideCounts: Map[Char, Int] = {
    var result = Map('A' -> 0, 'T' -> 0, 'C' -> 0, 'G' -> 0)
    strand.foreach { el => result += el -> (result(el) + 1) }
    return result
  }
}
