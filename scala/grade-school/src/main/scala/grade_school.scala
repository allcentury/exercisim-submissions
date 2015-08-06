class School {
  private var students = Map[Int, Seq[String]]().withDefaultValue(Seq())

  def add(name: String, grade: Int) = {
    if (students.contains(grade)) {
      var class_room = students(grade)
      class_room :+= name
      students += grade -> class_room
    } else {
      students += grade -> Seq(name)
    }
  }

  def db = students

  def grade(num: Int) = students(num)

  def sorted = students.toSeq.sortBy(_._1).toMap.mapValues(_.sorted)
}
