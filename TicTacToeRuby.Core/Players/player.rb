require_relative '../Validators/player_symbol_validator.rb'
require_relative '../../TicTacToeRuby.Console/Output/message_generator.rb'

class Player
  attr_reader :type, :symbol

  def initialize(type, symbol)
    raise ArgumentError, MessageGenerator.argument_error("initialize", "type", "invalid") if type.nil?
    raise ArgumentError, MessageGenerator.argument_error("initialize", "symbol", "invalid") if !PlayerSymbolValidator.valid?(symbol) 
    @type = type
    @symbol = symbol
  end

  def equals?(player)
    isEqual = @type == player.type && @symbol == player.symbol
  end
end
