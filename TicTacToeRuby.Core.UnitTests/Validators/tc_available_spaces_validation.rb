require 'test/unit'
require_relative '../../TicTacToeRuby.Core/Validators/available_spaces_validator.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'

class TestAvailableSpacesValidation < Test::Unit::TestCase
  def test_get_available_spaces_raises_an_error_when_board_is_nil
    assert_raises(ArgumentError) do AvailableSpacesValidator.get_available_spaces(nil) end
  end

  def test_alpha_character_is_not_a_valid_digit
    value = "A"
    result = AvailableSpacesValidator.digit?(value)
    assert_false(result, "An alpha character should not be marked as a valid digit.")
  end

  def test_space_character_is_not_a_valid_digit
    value = " "
    result = AvailableSpacesValidator.digit?(value)
    assert_false(result, "A space character should not be marked as a valid digit.")
  end

  def test_single_digit_character_is_a_valid_digit
    value = "1"
    result = AvailableSpacesValidator.digit?(value)
    assert(result, "A single digit character should be marked as a valid digit.")
  end

  def test_dual_digit_character_is_a_valid_digit
    value = "11"
    result = AvailableSpacesValidator.digit?(value)
    assert(result, "A dual digit character should be marked as a valid digit.")
  end

  def test_zero_is_a_valid_digit
    value = "0"
    result = AvailableSpacesValidator.digit?(value)
    assert(result, "A 0 should be marked as a valid digit.")
  end

  def test_negative_number_is_not_a_valid_digit_in_this_game
    value = "-1"
    result = AvailableSpacesValidator.digit?(value)
    assert_false(result, "A -1 should NOT be marked as a valid digit.")
  end

  def test_get_available_spaces_contains_one_element_when_there_is_only_one_available_spot_on_the_board
    board = ["X", "X", "X", "X", "X", "X", "X", "X", "9"]
    expected_result = 1
    available_spaces = AvailableSpacesValidator.get_available_spaces(board)
    actual_result = available_spaces.length
    assert_equal(expected_result, actual_result, "Errantly got #{actual_result} element(s) and list contains: #{available_spaces}.")
  end

  def test_get_available_spaces_contains_expected_index_when_there_is_only_one_available_spot_on_the_board
    board = ["X", "X", "X", "X", "X", "X", "X", "X", "9"]
    expected_result = 8
    available_spaces = AvailableSpacesValidator.get_available_spaces(board)
    actual_result = available_spaces[0]
    assert_equal(expected_result, actual_result, "Errantly got #{actual_result} as the index when expected to get #{expected_result}.")
  end

  def test_get_available_spaces_contains_zero_elements_when_there_are_no_available_spots_on_the_board
    board = ["X", "X", "X", "X", "X", "X", "X", "X", "X"]
    expected_result = 0
    available_spaces = AvailableSpacesValidator.get_available_spaces(board)
    actual_result = available_spaces.length
    assert_equal(expected_result, actual_result, "Errantly got #{actual_result} element(s) and it contains: #{available_spaces}.")
  end

  def test_get_available_spaces_contains_nine_elements_when_there_are_all_available_spots_on_the_board
    board = GameBoard.create_board
    expected_result = 9
    available_spaces = AvailableSpacesValidator.get_available_spaces(board)
    actual_result = available_spaces.length
    assert_equal(expected_result, actual_result, "Errantly got #{actual_result} element(s) and it contains: #{available_spaces}.")
  end
end