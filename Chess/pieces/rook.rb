require_relative "Slideable"

class Rook < Piece
  include Slideable

  def initialize
    @possible_moves = []
  end

  def moves
    9.times do |multiplier|
      next if multiplier == 0
      (VERTICAL + HORIZONTAL).each do |sub_arr|
        @possible_moves << sub_arr.map {|el| el * multiplier}
      end
    end
    @possible_moves
  end


  def valid_move?(start_pos, end_pos)
    if @possible_moves.any? do |sub_move|
      start_pos[0] + sub_move[0] == end_pos[0] && start_pos[1] + sub_move[1] == end_pos[1]
      end
    end
  end
end
