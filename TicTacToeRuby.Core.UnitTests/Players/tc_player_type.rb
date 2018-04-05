require 'test/unit'
require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/player_type_error.rb'

class TestPlayerType < Test::Unit::TestCase
  
  def test_player_type_sets_selected_option_to_human_when_it_is_used_during_initialization

    expected_option = :Human
    playerType = PlayerType.new(expected_option)

    assert_equal(expected_option, playerType.selected_option, 'Human should be selected.')
  end

  def test_player_type_sets_selected_option_to_computer_when_it_is_used_during_initialization

    expected_option = :Computer
    playerType = PlayerType.new(expected_option)

    assert_equal(expected_option, playerType.selected_option, 'Computer should be selected.')
  end

  def test_player_type_initialization_raises_PlayerTypeError_when_created_as_a_robot

    assert_raises(InvalidValueError) { PlayerType.new(:Robot) }
  end

  def test_valid_returns_true_when_human_is_entered_as_a_parameter

    option = :Human

    assert(PlayerType.valid?(option))
  end

  def test_valid_returns_true_when_computer_is_entered_as_a_parameter

    option = :Computer

    assert(PlayerType.valid?(option))
  end

  def test_valid_returns_false_when_robot_is_entered_as_a_parameter

    option = :Robot

    assert(!PlayerType.valid?(option))
  end
end

