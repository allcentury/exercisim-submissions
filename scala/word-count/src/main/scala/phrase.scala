class Phrase(input: String) {

  def wordCount: Map[String, Int] = {
    var s_input = input.replaceAll(",", " ")
    var str_arr = s_input.split(" ")
    var clean_words = sanatize(str_arr)
    var word_count = Map[String, Int]()
    clean_words.foreach { el =>
      if (word_count.get(el) == None) {
        word_count = word_count + (el -> 1)
      }else{
        var count = word_count(el) + 1
        word_count = word_count + (el -> count)
      }
    }

    return word_count
  }

  def sanatize(words: Array[String]): Array[String] = {
    var clean_words = Array[String]()
    words.foreach { word =>
      var stripped_word = word.replaceAll("""!|\.|@|#|\$|%|\^|&|\:|""", "")
      println(s"Stripped word is $stripped_word")
      if (stripped_word != "") {
        clean_words :+= stripped_word.toLowerCase
      }
    }
    return clean_words
  }
}
