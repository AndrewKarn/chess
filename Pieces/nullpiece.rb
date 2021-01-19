require_relative 'piece'
class NullPiece < Piece
  attr_reader :name
  def initialize
    @name = 'NullPiece'
  end
end
