# frozen_string_literal: true

require_relative 'piece'
class Board
  # attr_accessor
  def initialize(players = [])
    @board = Array.new(8) { Array.new(8) }
    @players = players
    fill_board
  end

  # helper to index into the board
  def pos(position)
    x, y = position
    @board[x][y]
  end

  def []=(position, ele)
    @board[position] = ele
  end

  def fill_board
    @board[-2].map! { |_row_ele| 'P' }
    @board[1].map! { |_row_ele|  'P' }
  end

  def board
    @board.each do |row|
      print " "
      row.each { |cell| print "#{cell}|" }
      puts "\n-------"
    end
  end
end
