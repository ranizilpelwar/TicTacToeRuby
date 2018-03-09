require 'test/unit'
require_relative '../../Players/player_type.rb'
require_relative '../../Players/player_movement_manager.rb'
require_relative '../../GamePlay/match_type.rb'

class TestPlayerMovementManager < Test::Unit::TestCase

  def setup
    @player1_type = PlayerType.new(:Human)
    @player2_type = PlayerType.new(:Computer)
    @type_of_match = MatchType.new(@player1_type, @player2_type)
    @player_movement_manager = PlayerMovementManager.new(@type_of_match)
  end

  def test_initialize_raises_an_exception_when_type_of_match_is_null
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

  def test_get_last_move_for_player_throws_exception_when_player_number_is_zero
    assert_raises(ArgumentError) { @player_movement_manager.get_last_move_for_player(0) }
  end  
end

