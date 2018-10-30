require 'Singleton'

class NullPiece
  include Singleton
  def initialize()
    @symbol = ' '
  end
end
