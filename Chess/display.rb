require_relative 'board'
require 'colorize'

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    #cursor_pos is an array
  end

  #cursor_pos is an array
  def render
    board[@cursor.cursor_pos].colorize(:red)
    board.rows
  end
end
