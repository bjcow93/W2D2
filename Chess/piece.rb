require 'colorize'

class Piece
  attr_reader :symbol, :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    # generic symbol for testing
    @symbol = "P"
    @board = board
    @pos = pos
  end

  def inspect
    print "#{@color}"
    print "#{@symbol}"
  end

# puts symbol and color
  def to_s
     " #{symbol} "
  end
end
