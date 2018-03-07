require 'test/unit'
require_relative '../../Players/Player.rb'
require_relative '../../Players/PlayerType.rb'
require_relative '../../Players/PlayerManager.rb'

class TestPlayerManager < Test::Unit::TestCase
  
  def setup
    @player1 = Player.new(:Human, "X")
    @player2 = Player.new(:Computer, "Y")
    @player_manager = PlayerManager.new(@player1, @player2)
  end

  def test_player_manager_get_next_player_returns_correct_player
    player = @player_manager.getNextPlayer()
    assert_equal(@player2, player)
  end

  def test_player_manager_get_next_player_does_not_update_current_player
    player = @player_manager.getNextPlayer()
    assert_equal(@player1, @player_manager.currentPlayer)
  end

  def test_player_manager_update_current_player_returns_correct_player
    player = @player_manager.updateCurrentPlayer()
    assert_equal(@player2, player)
  end

  def test_player_manager_update_current_player_does_update_the_current_player
    player = @player_manager.updateCurrentPlayer()
    assert_equal(@player2, @player_manager.currentPlayer)
  end
end
