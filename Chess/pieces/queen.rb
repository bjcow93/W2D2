require_relative "Slideable"

class Queen < Piece
  include Slideable

  def initialize
    #possible move variations for given piece. irrespective of position
    @possible_moves = []
  end

  def moves
    9.times do |multiplier|
      next if multiplier == 0
      (VERTICAL + HORIZONTAL + DIAGONAL).each do |sub_arr|
        @possible_moves << sub_arr.map {|el| el * multiplier}
      end
    end
    @possible_moves
  end


  def valid_move?(start_pos, end_pos)
    #checks if piece can move to end_pos from start_pos
    move_direction = []
    if @possible_moves.any? do |sub_move|
      start_pos[0] + sub_move[0] == end_pos[0] && start_pos[1] + sub_move[1] == end_pos[1]
      end
    end

    pieces_from_start_to_end = []
    (start_pos[0]..end_pos[0]).each do |row|
      (start_pos[1]..end_pos[1]).each do |col|
        pieces_from_start_to_end << @board[[row,col]]
      end
    end
    # if sub array has piece with value




    #check if piece in the way of move path

    #check if piece exists on end_pos
      #check if piece opposite color
        #take piece
      #else
        #raise "end position"


  end
end
