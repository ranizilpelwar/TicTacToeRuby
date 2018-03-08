require 'test/unit'
require_relative '../../Players/player.rb'
require_relative '../../Players/player_type.rb'
require_relative '../../Players/player_manager.rb'

class TestPlayerManagerInitialization < Test::Unit::TestCase
  
  def setup
    @player1 = Player.new(:Human, "X")
    @player2 = Player.new(:Computer, "Y")
    @player_manager = PlayerManager.new(@player1, @player2)
  end

  def test_player_manager_initialization_sets_player1_to_the_given_value
    assert_equal(@player1, @player_manager.player1)
  end

  def test_player_manager_initialization_sets_player2_to_the_given_value
    assert_equal(@player2, @player_manager.player2)
  end

  def test_player_manager_initialization_sets_current_player_to_the_first_player
    assert_equal(@player1, @player_manager.current_player)
  end
end
