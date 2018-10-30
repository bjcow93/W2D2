require_relative 'board'
require 'colorize'

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    #cursor_pos is an array
  end

  #cursor_pos is an array
  def render(color=:red)
    board[@cursor.cursor_pos].colorize(color)
    board.rows
  end

  def navigate_cursor(start_pos)
    render
    until @cursor.handle_key(key) == @cursor.cursor_pos
      render(:green)
    end
  end
end
