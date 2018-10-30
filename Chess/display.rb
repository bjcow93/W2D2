require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
  attr_reader :board

  def initialize(board = Board.new)
    @board = board
    #@board is now an object
    @cursor = Cursor.new([4,4], @board)
    show_board
  end

  #cursor_pos is an array
  def show_board(color=:red)
    #@cursor.cursor_pos = array position of current cursor.
    #board is an object with #[](pos) method defined
    @board[@cursor.cursor_pos].symbol.colorize(color)
    @board.render
  end

  def inspect
    print ""
  end

end
