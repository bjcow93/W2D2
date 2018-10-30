require_relative "display"
require_relative "board"

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      player1 => HumanPlayer.new(:white, @display),
      player2 => ComputerPlayer.new(:black, @display)
    }
  end

  def play
    @display
  end

end


if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
