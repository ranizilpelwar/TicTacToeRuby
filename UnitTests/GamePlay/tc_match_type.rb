require 'test/unit'
require_relative '../../Players/player_type.rb'
require_relative '../../Exceptions/player_type_error.rb'
require_relative '../../GamePlay/match_type.rb'

class TestMatchType < Test::Unit::TestCase
  
  def setup
    @player1_type = new_player_type(:Human)
    @player2_type = new_player_type(:Computer)
    @match_type = MatchType.new(@player1_type, @player2_type)
  end

  def new_player_type(type)
    PlayerType.new(type)
  end

  def test_match_type_sets_player1_type_when_it_is_used_during_initialization

    assert_equal(@player1_type, @match_type.player1_type, 'Player types should match for player 1.')
  end

  def test_match_type_sets_player2_type_when_it_is_used_during_initialization

    assert_equal(@player2_type, @match_type.player2_type, 'Player types should match for player 2.')
  end
end

