require_relative 'board'
require 'colorize'

class Display
  def initialize
    @cursor = Cursor.new([0,0], board)
  end
  def render
  end
end
