require 'test/unit'
require_relative '../../TicTacToeRuby.Core/Validators/player_symbol_validator.rb'

class TestPlayerSymbolValidation < Test::Unit::TestCase
  def test_when_input_is_an_empty_string_then_false_is_returned
    input = ""
    return_value = PlayerSymbolValidator.valid?(input)
    assert_false(return_value, "False should be returned when input is an empty string.")
  end
end
