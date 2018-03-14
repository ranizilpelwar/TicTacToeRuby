require_relative '../Validators/player_symbol_validator.rb'

class Player
  attr_reader :type, :symbol

  def initialize(type, symbol)
    raise ArgumentError, "Cannot create Player with an invalid symbol." unless PlayerSymbolValidator.valid?(symbol) 
    raise ArgumentError, "Cannot create Player with a nil type." unless type != nil
    @type = type
    @symbol = symbol
  end

  def equals?(player)
    isEqual = @type == player.type && @symbol == player.symbol ? true : false
  end
end
