class Player
  attr_reader :type, :symbol

  def initialize(type, symbol)
    @type = type
    @symbol = symbol
  end

  def equals?(player)
    isEqual = false
    if (player != nil)
      if (type == player.type && symbol == player.symbol)
        isEqual = true
      end
    end
    return isEqual
  end
end