require 'pry'
class Queens
  attr_reader :white, :black
  def initialize
    @board = build_board
    @black = current_position('w')
    @white = current_position('b')
  end

  def build_board
    board = Array.new(8, Array.new(8))
    board[0][3] = 'w'
    board[7][3] = 'b'
    board
  end

  def current_position(color)
    @board.each_with_index do |row, i|
      row.each_with_index do |col, j|
        if col == color
          binding.pry
        end
      end
    end
  end

end
