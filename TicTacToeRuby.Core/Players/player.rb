require_relative '../Validators/player_symbol_validator.rb'
require_relative '../../TicTacToeRuby.Core/Languages/message_generator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

class Player
  attr_reader :type, :symbol

  def initialize(type, symbol)
    raise NilReferenceError, "type" if type.nil?
    raise InvalidValueError, "symbol" if !PlayerSymbolValidator.valid?(symbol) 
    @type = type
    @symbol = symbol
  end

  def equals?(player)
    isEqual = @type == player.type && @symbol == player.symbol
  end

end
