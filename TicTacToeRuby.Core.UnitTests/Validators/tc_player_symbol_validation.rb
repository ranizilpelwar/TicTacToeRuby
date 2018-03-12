require 'test/unit'
require_relative '../../TicTacToeRuby.Core/Validators/player_symbol_validator.rb'

class TestPlayerSymbolValidation < Test::Unit::TestCase
  def test_an_empty_string_is_not_a_valid_player_symbol
    input = ""
    return_value = PlayerSymbolValidator.valid?(input)
    assert_false(return_value, "An empty string should not be a valid player symbol.")
  end

  def test_a_digit_is_not_a_valid_player_symbol
    input = "1"
    return_value = PlayerSymbolValidator.valid?(input)
    assert_false(return_value, "A digit should not be a valid symbol.")
  end

  def test_input_with_length_greater_than_one_is_not_a_valid_player_symbol
    input = "XX"
    return_value = PlayerSymbolValidator.valid?(input)
    assert_false(return_value, "An input with length greater than one is not a valid symbol.")
  end

  
end
