class Robot
  attr_accessor :bearing, :coordinates

  def at(x, y)
    @coordinates = [x, y]
  end

  def orient(direction)
    accepted_directions = [
      :east, :west, :north, :south
    ]

    if accepted_directions.include?(direction)
      @bearing = direction
    else
      raise ArgumentError, "Invalid direction given"
    end
  end

  def advance
    x, y = coordinates.first, coordinates.last
    case bearing
    when :north
      y += 1
    when :east
      x += 1
    when :south
      y -= 1
    when :west
      x -= 1
    end

    @coordinates = [x, y]
  end

  def turn_left
    @bearing = case bearing
               when :north
                 :west
               when :east
                 :north
               when :south
                 :east
               when :west
                 :south
               end
  end

  def turn_right
    @bearing = case bearing
               when :east
                 :south
               when :north
                 :east
               when :south
                 :west
               when :west
                 :north
               end
  end

end

class Simulator

  def instructions(letters)
    # i feel like there is a way to do this with String#tr but coudln't get it
    keys = {
      "L" => :turn_left,
      "R" => :turn_right,
      "A" => :advance
    }

    letters.chars.map { |letter| keys[letter] }
  end

  def place(robot, x:, y:, direction:)
    robot.coordinates = [x, y]
    robot.bearing = direction
  end

  def evaluate(robot, letters)
    movements = instructions(letters)
    movements.each { |movement| robot.send(movement) }
  end

end
