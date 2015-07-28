require 'set'
class Board
  attr_reader :raw_board
  def initialize(raw_board)
    @raw_board = raw_board
  end

  def to_a
    raw_board.to_a
  end

  def characters
    raw_board.join.split(//)
  end

  def populate_board
    raw_board.to_a.each_with_object([]).with_index do |(row, new_board), j|
      if row.include?('+') && row.include?('-') # border row
        new_board << row
        next
      end

      new_board << row.split(//).each_with_object([]).with_index do |(point, current_row), i|
        if point == '|' || point == "*"
          current_row << point
          next
        end

        if point == " "
          # count mines around space
          mines = 0
          mines += check_up(raw_board[j-1], i)
          mines += check_current(row, i)
          mines += check_below(raw_board[j+1], i)
          sub_point = mines == 0 ? " " : mines
          current_row << sub_point
        end
      end.join
    end
  end

  def self.transform(raw_board)
    board = new(raw_board)
    board.validate
    board.populate_board
  end

  def validate
    raise ValueError if invalid_board?
  end

  private

  def mines_within_1(row, pos)
    ctr = 0
    row.split(//).each_with_index do |el, i|
      ctr += 1 if el == "*" && ( pos - i == 0 || (pos - i).abs == 1 )
    end
    ctr
  end

  alias :check_up :mines_within_1
  alias :check_current :mines_within_1
  alias :check_below :mines_within_1

  def invalid_board?
    return true if raw_board.map(&:length).uniq.size > 1
    return true if faulty_borders?
    return true if include_invalid_chars?
    false
  end

  def faulty_borders?
    raw_board.each_with_index do |row, i|
      if i == 0 || i == raw_board.size - 1 # match first and last row
        row.split(//).each_with_index do |el, j|
          if j == 0 || j == row.length - 1 # check first last el
            return true unless el == "+"
          elsif el != "-" # check for missing "-"
            return true
          end
        end
      end
    end
    false
  end

  def include_invalid_chars?
    valid_chars = Set.new(["*", "|", "+", "-", " "])
    characters.any? { |char| !valid_chars.include?(char) }
  end

end

class ValueError < StandardError; end
