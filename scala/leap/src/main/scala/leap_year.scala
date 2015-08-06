class Year(input: Int) {
  def isLeap: Boolean = {
    input % 100 != 0 && input % 400 == 0 || input % 4 == 0
  }
}
object Year {
  def apply(input: Int) = new Year(input)
}
