# frozen_string_literal: true

require_relative 'Pieces/piece'
require_relative 'Pieces/nullpiece'

class Board
  # attr_accessor
  def initialize(players = [])
    @board = Array.new(8) { Array.new(8) { NullPiece.new } }
    @players = players
    # drop the pawns in
    @board.map! { |row_ele| row_ele.name }
    @board[-2].map! { |_row_ele| 'Pawn ' }
    @board[1].map! { |a| 'Pawn ' }
  end

  def board
    system('clear')
    @board.each { |row| puts row.join }
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    if !@board[row].nil? && !@board[col].nil?
      @board[row][col] = piece
    else
      raise 'Invalid Move'
    end
  end

  def move_piece(start_pos, end_pos)
    if self::valid_move(start_pos, end_pos)
      piece = self[start_pos]
      self[end_pos] = piece
      self[start_pos] = "empty"
    else
      p end_pos
      raise "Invalid move"
    end
  end

  def valid_move(start, end_pos)
    self[start] != nil || (self[end_pos] || nil) != nil
  end
end

test = Board.new
test.board
