require_relative "display"
require_relative "board"
require_relative "humanplayer"

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    # @players = {
    #   white: HumanPlayer.new(:white, @display),
    #   black: HumanPlayer.new(:black, @display)
    # }
  end

  def play
    @display
  end

end


if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
