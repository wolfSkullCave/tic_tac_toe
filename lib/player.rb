class Player
  attr_reader :name, :symbol

  def initialize(symbol)
    @symbol = symbol
    @name = "Player #{symbol.upcase}"
  end
end

module Player
  def set_player_1
    
  end
end