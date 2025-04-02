# frozen_string_literal: true

require 'colorize'

# The Board class represents the game board for a Tic Tac Toe game.
class Board
  attr_accessor :board

  # Initializes the board with empty spaces for all positions.
  def initialize
    @board = {
      a1: ' ', a2: ' ', a3: ' ',
      b1: ' ', b2: ' ', b3: ' ',
      c1: ' ', c2: ' ', c3: ' '
    }
  end

  protected

  # Displays the current state of the board.
  def draw(board = self.board)
    puts "#{board[:a1]} | #{board[:a2]} | #{board[:a3]}"
    puts "#{board[:b1]} | #{board[:b2]} | #{board[:b3]}"
    puts "#{board[:c1]} | #{board[:c2]} | #{board[:c3]}"
  end

  # Checks if the board is full (i.e., no empty spaces remain).
  def full?
    @board.values.none? { |value| value.strip.empty? }
  end

  def board_positions
    positions = {
      a1: 'a1', a2: 'a2', a3: 'a3',
      b1: 'b1', b2: 'b2', b3: 'b3',
      c1: 'c1', c2: 'c2', c3: 'c3'
    }

    # colors the position values as grey
    positions.each do |position, value|
      positions[position] = value.colorize(:light_black)
    end

    puts "board positions:".colorize(:yellow)
    draw(positions)
  end
end
