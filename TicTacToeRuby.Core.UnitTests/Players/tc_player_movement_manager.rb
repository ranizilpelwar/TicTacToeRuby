require 'test/unit'
require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_movement_manager.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'

class TestPlayerMovementManager < Test::Unit::TestCase

  def setup
    @player1_type = PlayerType.new(:Human)
    @player2_type = PlayerType.new(:Computer)
    @type_of_match = MatchType.new(@player1_type, @player2_type)
    @player_movement_manager = PlayerMovementManager.new(@type_of_match)
  end

  def test_initialize_raises_an_exception_when_type_of_match_is_nil
    type_of_match = nil
    assert_raises(ArgumentError) { PlayerMovementManager.new(type_of_match) }
  end

  def test_initialize_sets_last_move_of_player1_to_negative_one_when_type_of_match_is_given
    assert_equal(-1, @player_movement_manager.player1_last_move, "Initial last move should be -1.")
  end

  def test_initialize_sets_last_move_of_player2_to_negative_one_when_type_of_match_is_given
    assert_equal(-1, @player_movement_manager.player2_last_move, "Initial last move should be -1.")
  end

  def test_initialize_sets_match_type_to_what_is_given
    assert_equal(@type_of_match, @player_movement_manager.match_type, "Match types should be the same")
  end

  def test_get_last_move_for_player_raises_ArgumentError_when_player_number_is_zero
    assert_raises(ArgumentError) { @player_movement_manager.get_last_move_for_player(0) }
  end  

  def test_get_last_move_for_player_raises_ArgumentError_when_player_number_is_negative
    assert_raises(ArgumentError) { @player_movement_manager.get_last_move_for_player(-1) }
  end

  def test_get_last_move_for_player_raises_ArgumentError_when_player_number_is_three
    assert_raises(ArgumentError) { @player_movement_manager.get_last_move_for_player(3) }
  end

  def test_get_last_move_returns_last_move_for_player1_when_player_number_is_one
    player_number = 1
    updated_move = 5
    @player_movement_manager.update_last_move_for_player(player_number, updated_move)
    assert_equal(updated_move, @player_movement_manager.get_last_move_for_player(player_number))
  end

  def test_get_last_move_returns_last_move_for_player2_when_player_number_is_two
    player_number = 2
    updated_move = 5
    @player_movement_manager.update_last_move_for_player(player_number, updated_move)
    assert_equal(updated_move, @player_movement_manager.get_last_move_for_player(player_number))
  end

  def test_raises_ArgumentError_when_move_is_negative_one
    assert_raises(ArgumentError) { @player_movement_manager.raise_argument_error_for_invalid_move(-1) }
  end

  def test_an_exception_is_raised_when_move_is_greater_than_largest_index
     largest_index = PlayerMovementManager::LARGEST_INDEX + 1
     assert_raises(ArgumentError) { @player_movement_manager.raise_argument_error_for_invalid_move(largest_index) }
  end

  def test_last_move_is_updated_when_move_is_zero
    player_number = 1
    move = 0
    @player_movement_manager.update_last_move_for_player(player_number, move)
    assert_equal(move, @player_movement_manager.get_last_move_for_player(player_number))
  end

  def test_last_move_is_updated_when_move_is_the_same_as_the_largest_index
    player_number = 1
    move = PlayerMovementManager::LARGEST_INDEX
    @player_movement_manager.update_last_move_for_player(player_number, move)
    assert_equal(move, @player_movement_manager.get_last_move_for_player(player_number))
  end
end

