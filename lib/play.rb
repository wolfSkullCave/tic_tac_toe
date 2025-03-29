require_relative 'board'

class Play < Board
  attr_accessor :player_1, :player_2

  def initialize
    super()
    @player_1 = 'X'
    @player_2 = 'O'
  end

  def move
    draw
    loop do
      # check if board is full
      if full?
        puts "Its a draw"
        break
      end

      # Player 1's turn
      move_player(self.player_1)
      draw
      if win_condition?(self.player_1)
        puts "Player #{self.player_1} wins!"
        break
      end

      # Player 2's turn
      move_player(self.player_2)
      draw
      if win_condition?(self.player_2)
        puts "Player #{self.player_2} wins!"
        break
      end
    end
  end

  private

  def move_player(player)
   puts "Player #{player} move:"
   move = gets.chomp.to_sym
   if self.board[move] && self.board[move] == ' '
    self.board[move] = player
   else
    puts "Invalid move: #{move}"
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
end