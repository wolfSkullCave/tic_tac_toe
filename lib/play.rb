require_relative 'board'
require 'colorize'

class Play < Board
  attr_accessor :player_1, :player_2

  def initialize
    super()
    @player_1 = "X".colorize(:blue)
    @player_2 = "O".colorize(:green)
  end

  def move
    loop do
      puts setup      

      # Player 1's turn
      move_player(self.player_1)
      draw
      if win_condition?(self.player_1)
        puts "Player #{self.player_1} wins!".colorize(:yellow)
        break
      elsif full? # check for a draw
        puts "Its a draw".colorize(:yellow)
        break
      end

      # Player 2's turn
      move_player(self.player_2)
      draw
      if win_condition?(self.player_2)
        puts "Player #{self.player_2} wins!".colorize(:yellow)
        break
      elsif full? # check for a draw
        puts "Its a draw".colorize(:yellow)
        break
      end
    end
  end

  private

  def move_player(player)
    loop do
      puts "Player #{player} move:"
      move = gets.chomp.to_sym

      # Check if move is valid
      if self.board[move] && self.board[move] == ' '
        self.board[move] = player
        break # Exit loop when a valid move is made
      else
        puts "Invalid move: #{move}. Please try again"
      end
    end
  end

  def win_condition?(player)
    # top row (a) win conditions
    if self.board[:a1] == player && 
      self.board[:a2] == player && 
      self.board[:a3] == player
      return true
    elsif self.board[:a1] == player && 
      self.board[:b1] == player && 
      self.board[:c1] == player
      return true
    elsif self.board[:a1] == player && 
      self.board[:b2] == player && 
      self.board[:c3] == player
      return true
    end

    # b row win conditions
    if self.board[:b1] == player && 
      self.board[:b2] == player && 
      self.board[:b3] == player
      return true
    elsif self.board[:a2] == player && 
      self.board[:b2] == player && 
      self.board[:c3] == player
      return true
    elsif self.board[:a1] == player && 
      self.board[:b2] == player && 
      self.board[:c3] == player
      return true
    end

    # c row win conditions
    if self.board[:c1] == player && 
      self.board[:c2] == player && 
      self.board[:c3] == player
      return true
    elsif self.board[:c1] == player && 
      self.board[:b2] == player && 
      self.board[:a3] == player
      return true
    elsif self.board[:a1] == player && 
      self.board[:b2] == player && 
      self.board[:c3] == player
      return true
    end

    return false
  end

  def test_win_conditions
    board = Board.new
    puts board.full? # Should return false (board is empty)

    board.board[:a1] = 'X'
    board.board[:a2] = 'O'
    board.board[:a3] = 'X'
    board.board[:b1] = 'O'
    board.board[:b2] = 'X'
    board.board[:b3] = 'O'
    board.board[:c1] = 'X'
    board.board[:c2] = 'O'
    board.board[:c3] = 'X'

    puts board.full? # Should return true (board is full)
  end

end