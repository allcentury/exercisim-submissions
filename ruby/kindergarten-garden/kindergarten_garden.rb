class Garden
  def initialize(str, students = nil)
    @str = str
    @window = build_window_sill
    @class_room = students ? students : default_class
    @class_room.sort!
    build_class_gardens
  end

  private

  def build_class_gardens
    students = @class_room.first(@window.first.size / 2)

    students.each_with_index do |student, index|
      instance_variable_set("@#{student.downcase}", find_garden(index))
      self.class.send(:attr_reader, student.downcase)
    end
  end

  def find_garden(index)
    # times index by 2 to get start location since each student has 2 cups
    index *= 2

    # get plants from both rows
    plants = [@window.first[index..index+1], @window.last[index..index+1]]

    plants.join.chars.each_with_object([]) do |letter, results|
      results << garden_mappings[letter]
    end
  end

  def build_window_sill
    @str.split("\n")
  end

  def default_class
    [
      :alice, :bob, :charlie, :david,
      :eve, :fred, :ginny, :harriet,
      :ileana, :joseph, :kincaid, :larry
    ]
  end

  def garden_mappings
    {
      "V" => :violets,
      "R" => :radishes,
      "C" => :clover,
      "G" => :grass
    }
  end

end
