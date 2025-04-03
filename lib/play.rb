# frozen_string_literal: true

require_relative 'board'
require 'colorize'

# The Play class handles the game logic for Tic Tac Toe.
# It inherits from the board class and manages player turns,
# validates moves, and checks for win or draw conditions.
class Play < Board
  attr_accessor :player1, :player2

  def initialize
    super()
    @player1 = 'X'.colorize(:blue)
    @player2 = 'O'.colorize(:green)
  end

  def move
    board_positions # display board co-ordinates (a1, a2, a3, etc.)

    [player1, player2].cycle do |current_player|
      break if turn(current_player)
    end
  end

  private

  # Handles a player's turn and checks for game-ending conditions.
  def turn(player)
    move_player(player)
    board_positions # display board co-ordinates (a1, a2, a3, etc.)
    draw # Draw the current state of the board
    if winner?(player)
      puts "Player #{player} wins!".colorize(:yellow)
      true
    elsif full?
      puts 'It\'s a draw'.colorize(:yellow)
      true
    else
      false
    end
  end

  # Prompts the player to make a valid move.
  def move_player(player)
    loop do
      puts "Player #{player}, make your move:"
      move = gets.chomp.to_sym

      if valid_move?(move)
        board[move] = player
        break
      else
        puts "Invalid move: #{move}. Please try again."
      end
    end
  end

  # Checks if the move is valid.
  def valid_move?(move)
    board[move] && board[move] == ' '
  end

  # Checks if the player has a winning combination.
  def winner?(player)
    winning_combinations.any? do |combination|
      combination.all? { |position| board[position] == player }
    end
  end

  # Defines all possible winning combinations.
  def winning_combinations
    [
      %i[a1 a2 a3], %i[b1 b2 b3], %i[c1 c2 c3], # Rows
      %i[a1 b1 c1], %i[a2 b2 c2], %i[a3 b3 c3], # Columns
      %i[a1 b2 c3], %i[a3 b2 c1] # Diagonals
    ]
  end
end
