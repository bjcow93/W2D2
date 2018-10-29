require_relative "piece", 'display'

class Board
  attr_accessor :rows

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    @sentinel = nil   #NullPiece
    populate_board
  end

# private method. get logic workings
  def populate_board
    @rows.each_with_index do |row, row_idx|
      if row_idx == 0 || row_idx == 1
        row.each_with_index do |piece, col_idx|
          piece = Piece.new(:black, self, [row_idx, col_idx])

          @rows[row_idx][col_idx] = piece
        end
      # elsif row_idx.between?(3,5)
      #   row.each_with_index do |piece, col_idx|
      #     piece = Piece.new(:black, self, [row_idx, col_idx])
      #   end
      # end
      elsif row_idx.between?(6,7)
        row.each_with_index do |piece, col_idx|
          piece = Piece.new(:white, self, [row_idx, col_idx])

          @rows[row_idx][col_idx]  = piece
        end
      end
    end
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @rows[row][col] = value
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
    @rows
  end
  #need Piece and NullPiece. NullPiece < Piece

end
