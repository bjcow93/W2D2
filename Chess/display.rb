require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
  attr_reader :board_dup

  def initialize(board = Board.new)
    @board_dup = board
    #@board_dup is now an object
    @cursor = Cursor.new([4,4], @board_dup)
    navigate_cursor
  end

  #cursor_pos is an array
  def show_board(color=:red)
    #@cursor.cursor_pos = array position of current cursor.
    #board_dup is an object with #[](pos) method defined
    @board_dup[@cursor.cursor_pos].symbol.colorize(color)
    @board_dup.render
  end


  def navigate_cursor
    show_board
    # until @cursor.handle_key(key) == @cursor.cursor_pos
    #   show_board(:green)
    # end
  end

  def inspect
    print ""
  end

end
