require 'Singleton'

class NullPiece
  include Singleton
  attr_reader :symbol, :color

  def initialize
    @symbol = ' '
    @color = nil
  end

  def to_s
     " #{symbol} "
  end
end
