class Board
  attr_accessor :board

  def initialize
    self.board = {
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

  def draw
    puts "#{self.board[:a1]}|#{self.board[:a2]}|#{self.board[:a3]}"
    puts "#{self.board[:b1]}|#{self.board[:b2]}|#{self.board[:b3]}"
    puts "#{self.board[:c1]}|#{self.board[:c2]}|#{self.board[:c3]}"
  end

  def full?
    @board.values.all? { |value| value != ' ' }
  end
end
