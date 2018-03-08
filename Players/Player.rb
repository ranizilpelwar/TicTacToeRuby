class Player
  attr_reader :type, :symbol

  def initialize(type, symbol)
    @type = type
    @symbol = symbol
  end

  def equals?(player)
    isEqual = @type == player.type && @symbol == player.symbol ? true : false
  end
end
