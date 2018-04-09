require 'test/unit'
require_relative '../../TicTacToeRuby.Core/Validators/player_symbol_validator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

class TestPlayerSymbolValidation < Test::Unit::TestCase
  def test_an_empty_string_is_not_a_valid_player_symbol
    input = ""
    assert_raise InvalidValueError do PlayerSymbolValidator.valid?(input) end
  end

  def test_a_single_digit_value_is_not_a_valid_player_symbol
    input = "1"
    return_value = PlayerSymbolValidator.valid?(input)
    assert_false(return_value, "A single digit should not be a valid player symbol.")
  end

  def test_a_two_digit_value_is_not_a_valid_player_symbol
    input = "10"
    return_value = PlayerSymbolValidator.valid?(input)
    assert_false(return_value, "A two digit value should not be a valid player symbol.")
  end

  def test_input_with_length_greater_than_one_is_not_a_valid_player_symbol
    input = "XX"
    return_value = PlayerSymbolValidator.valid?(input)
    assert_false(return_value, "An input with length greater than one is not a valid player symbol.")
  end

  def test_an_upper_case_alpha_character_is_a_valid_player_symbol
    input = "A"
    return_value = PlayerSymbolValidator.valid?(input)
    assert(return_value, "An upper case alpha character should be a valid player symbol.")
  end

  def test_a_lower_case_alpha_character_is_a_valid_player_symbol
    input = "a"
    return_value = PlayerSymbolValidator.valid?(input)
    assert(return_value, "A lower case alpha character should be a valid player symbol.")
  end

  def test_a_percent_character_is_a_valid_player_symbol
    input = "%"
    return_value = PlayerSymbolValidator.valid?(input)
    assert(return_value, "A percent character should be a valid player symbol.")
  end

  def test_a_pound_character_is_a_valid_player_symbol
    input = "#"
    return_value = PlayerSymbolValidator.valid?(input)
    assert(return_value, "A pound character should be a valid player symbol.")
  end

    def test_a_space_character_is_not_a_valid_player_symbol
    input = " "
    return_value = PlayerSymbolValidator.valid?(input)
    assert_false(return_value, "A space character should not be a valid player symbol.")
  end
end
