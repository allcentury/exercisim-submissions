class Anagram(key_word: String) {

  def matches(words: Seq[String]): Seq[String] = {
    var key_letters = letter_sort(key_word)
    var answer = Seq[String]()
    var clean_words = words.filter(_ != key_word).distinct

    clean_words.foreach { word =>
      if (key_letters == letter_sort(word) && word.toLowerCase != key_word) {
        answer :+= word
      }
    }
    return answer
  }

  def letter_sort(word: String): Seq[Char] = {
    var d_word = word.toLowerCase
    var result = Seq[Char]()
    for (i <- 0 until d_word.length) {
      result :+= d_word(i)
    }
    return result.sorted
  }

}
