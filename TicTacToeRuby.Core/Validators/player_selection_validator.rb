require_relative '../../TicTacToeRuby.Core/Languages/message_generator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

module PlayerSelectionValidator
  def self.valid?(input, player_symbol_one, player_symbol_two)
    raise NilReferenceError, "input" if input.nil?
    raise NilReferenceError, "player_symbol_one" if player_symbol_one.nil?
    raise NilReferenceError, "player_symbol_two" if player_symbol_two.nil?
    raise InvalidValueError, "input" if input == ""
    raise InvalidValueError, "player_symbol_one" if player_symbol_one == ""
    raise InvalidValueError, "player_symbol_two" if player_symbol_two == ""
    input_upcase = input.upcase
    valid = input_upcase == player_symbol_one.upcase || input_upcase == player_symbol_two.upcase
  end
end
