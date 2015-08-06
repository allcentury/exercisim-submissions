import scala.util.Random

class Robot {
  private var g_name = generate_name

  def name = g_name

  def generate_name = {
    val random = new Random()
    val nums = random.nextInt(899) + 100
    val letters = ('a' to 'z') ++ ('A' to 'Z')
    val random_letters = letters(random.nextInt(letters.length)).toString + letters(random.nextInt(letters.length)).toString
    s"$random_letters$nums"
  }

  def reset() = {
    g_name = generate_name
  }
}
