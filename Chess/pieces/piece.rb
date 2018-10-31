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

  def moves
    possible_moves = []
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


#start_pos = [3,3]
#end_pos = [5,7]
