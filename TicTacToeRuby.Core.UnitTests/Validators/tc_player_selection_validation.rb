require 'test/unit'
require_relative '../../TicTacToeRuby.Core/Validators/player_selection_validator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

class TestPlayerSelectionValidation < Test::Unit::TestCase
  def test_an_empty_string_should_not_match_symbol_entries
    input = ""
    player_symbol_one = "A"
    player_symbol_two = "B"
    assert_raise InvalidValueError do PlayerSelectionValidator.valid?(input, player_symbol_one, player_symbol_two) end
  end

  def test_a_space_character_should_not_match_symbol_entries
    input = " "
    player_symbol_one = "A"
    player_symbol_two = "B"
    return_value = PlayerSelectionValidator.valid?(input, player_symbol_one, player_symbol_two)
    assert_false(return_value, "A space character should not match symbol entries.")
  end

  def test_a_digit_should_not_match_symbol_entries
    input = "1"
    player_symbol_one = "A"
    player_symbol_two = "B"
    return_value = PlayerSelectionValidator.valid?(input, player_symbol_one, player_symbol_two)
    assert_false(return_value, "A digit should not match symbol entries.")
  end

  def test_a_lowercase_value_should_match_a_symbol_entry_for_player_one
    input = "a"
    player_symbol_one = "A"
    player_symbol_two = "B"
    return_value = PlayerSelectionValidator.valid?(input, player_symbol_one, player_symbol_two)
    assert(return_value, "A lowercase value should match a symbol entry for player one.")
  end

  def test_a_lowercase_value_should_match_a_symbol_entry_for_player_two
    input = "b"
    player_symbol_one = "A"
    player_symbol_two = "B"
    return_value = PlayerSelectionValidator.valid?(input, player_symbol_one, player_symbol_two)
    assert(return_value, "A lowercase value should match a symbol entry for player two.")
  end
end
