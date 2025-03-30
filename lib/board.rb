require 'colorize'
class Board
  attr_accessor :board

  def initialize
    @board = {
      a1: ' ',
      a2: ' ',
      a3: ' ',
      b1: ' ',
      b2: ' ',
      b3: ' ',
      c1: ' ',
      c2: ' ',
      c3: ' '
    }
  end

  protected

  def draw(board = self.board)
    puts "#{board[:a1]} | #{board[:a2]} | #{board[:a3]}"
    puts "#{board[:b1]} | #{board[:b2]} | #{board[:b3]}"
    puts "#{board[:c1]} | #{board[:c2]} | #{board[:c3]}"
  end

  def full?
    @board.values.all? { |value| value != ' ' }
  end

  def setup
    board_positions = {
      a1: 'a1'.colorize(:grey),
      a2: 'a2'.colorize(:grey),
      a3: 'a3'.colorize(:grey),
      b1: 'b1'.colorize(:grey),
      b2: 'b2'.colorize(:grey),
      b3: 'b3'.colorize(:grey),
      c1: 'c1'.colorize(:grey),
      c2: 'c2'.colorize(:grey),
      c3: 'c3'.colorize(:grey)
    }
    puts 'Board positions:'
    draw(board_positions)
  end
end
