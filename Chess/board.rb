require_relative "piece"
require_relative "display"
require_relative "nullpiece"


class Board
  attr_accessor :grid

  def initialize
    @sentinel = NullPiece.instance
    @grid = Array.new(8) {Array.new(8, @sentinel)}
   #NullPiece
   populate_board
  #  render
  end

# private method. get logic workings
  def populate_board
    @grid.each_with_index do |row, row_idx|
      if row_idx == 0 || row_idx == 1
        row.each_with_index do |piece, col_idx|
          piece = Piece.new(:black, self, [row_idx, col_idx])
          # print piece.symbol
          @grid[row_idx][col_idx] = piece
        end

      elsif row_idx.between?(6,7)
        row.each_with_index do |piece, col_idx|
          piece = Piece.new(:white, self, [row_idx, col_idx])
          # print piece.symbol
          @grid[row_idx][col_idx]  = piece
        end
      end
    end
  end

  def render
    @grid.each do |row|
      row.each do |piece|
        print piece.symbol
      end
      puts
    end
  end

  # override inspect method
  def inspect
    print ""
  end

  # def dup
  #   self.dup # @grid.map {|el| el.is_a?(Array) ? el.dup : el}
  # end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    # start_pos and end_pos are arrays of 2 elements (i.e. [1,2])
    begin
      row,col = start_pos
      end_row, end_col = end_pos

      if !row.between?(0,7) || !col.between?(0,7)
        raise "Start position outside of board range you fool"
      elsif !end_row.between?(0,7) || !end_col.between?(0,7)
        raise "End position is outside of board range"
      elsif self[start_pos].nil?   #is_a?(NullPiece)
        raise "There is no piece in that position."
      # else
        # either invalid move for type of piece
        # OR position is already occupied
      end
    end
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
    @grid
  end
  #need Piece and NullPiece. NullPiece < Piece

  def valid_pos?(pos)
    row,col = pos
    return false if !row.between?(0,7) || !col.between?(0,7)
    true
  end

end
