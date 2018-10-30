require_relative "Slideable"
require_relative "piece"

class Bishop < Piece
  include Slideable
  attr_reader :possible_moves

  def initialize
    @possible_moves = []
  end

  # DIAGONAL = [[1,1], [1,-1], [-1,1], [-1,-1]]
  def move_dirs

  end


def moves
  9.times do |multiplier|
    next if multiplier == 0
    DIAGONAL.each do |sub_arr|
      @possible_moves << sub_arr.map {|el| el * multiplier}
    end
  end
  @possible_moves
end


def valid_move?(start_pos, end_pos)
  if res.any? do |sub_move|
    start_pos[0] + sub_move[0] == end_pos[0] && start_pos[1] + sub_move[1] == end_pos[1]
    end
  end
end

end
