object Hamming {
  def compute(dna1: String, dna2: String): Int = {
    if (dna1.length != dna2.length) {
      throw new IllegalArgumentException
    }
    var ctr = 0
    for (i <- 0 until dna1.length) {
      if (dna1(i) != dna2(i)) {
        ctr += 1
      }
    }
    return ctr
  }
}
