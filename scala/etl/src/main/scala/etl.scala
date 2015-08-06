object ETL {
  def transform(input: Map[Int, Seq[String]]): Map[String, Int] = {
    var output = Map[String, Int]()
    input.foreach { case(num, words) => words.foreach { word => output += word.toLowerCase -> num } }
    output
  }
}
