require 'test/unit'
require_relative '../../TicTacToeRuby.Core/Players/player.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_manager.rb'

class TestPlayerManager < Test::Unit::TestCase
  
  def setup
    @player1 = Player.new(:Human, "X")
    @player2 = Player.new(:Computer, "Y")
    @player_manager = PlayerManager.new(@player1, @player2)
  end

  def test_player_manager_get_next_player_returns_correct_player
    player = @player_manager.get_next_player
    assert_equal(@player2, player)
  end

  def test_player_manager_get_next_player_does_not_update_current_player
    player = @player_manager.get_next_player
    assert_equal(@player1, @player_manager.current_player)
  end

  def test_player_manager_update_current_player_returns_correct_player
    player = @player_manager.update_current_player
    assert_equal(@player2, player)
  end

  def test_player_manager_update_current_player_does_update_the_current_player
    player = @player_manager.update_current_player
    assert_equal(@player2, @player_manager.current_player)
  end

  def test_get_player_number_returns_one_when_player1_is_provided
    assert_equal(1, @player_manager.get_player_number(@player1))
  end
  
  def test_get_player_number_returns_two_when_player2_is_provided
    assert_equal(2, @player_manager.get_player_number(@player2))
  end
  
  def test_get_player_number_returns_negative_one_when_player_cannot_be_found
    player = Player.new(:Human, "O")
    assert_equal(-1, @player_manager.get_player_number(player))
  end

  def test_get_player_number_raises_a_nil_reference_error_when_player_is_nil
    assert_raises(NilReferenceError) do
      @player_manager.get_player_number(nil)
    end
  end
end
