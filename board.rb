# frozen_string_literal: true

require_relative 'piece'
class Board
  # attr_accessor
  def initialize(players = [])
    @board = Array.new(8) { Array.new(8) }
    @players = players
    @board[-2].map! { |_row_ele| 'Pawn ' }
    @board[1].map! { |_row_ele|  'Pawn ' }
  end

  def board
    system("clear")
    @board.each { |row| puts row.join }
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @board[row][col] = piece
  end

  def move_piece(start_pos, end_pos)
    if self::valid_move(start_pos, end_pos)
      piece = self[start_pos]
      self[end_pos] = piece
      self[start_pos] = "empty"
    else
      raise "Invalid move"
    end
  end

  def valid_move(start, end_pos)
    self[start] != nil
  end
end

test = Board.new
test.board
