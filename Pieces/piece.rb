# frozen_string_literal: true

# Abstract chess piece
class Piece < Object
  def initialize(board)
    @color = 'Black'
    @pos = []
    @board = board
  end
end
