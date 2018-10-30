require_relative "display"
require_relative "board"

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {

    }
  end

  def play
    @display
  end

end


if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
