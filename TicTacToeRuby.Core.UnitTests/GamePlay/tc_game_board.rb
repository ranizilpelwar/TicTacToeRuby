require 'test/unit'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../Players/mock_player_manager.rb'

class TestGameBoard < Test::Unit::TestCase
  def test_initialize_will_raise_an_exception_when_player_manager_is_nil
    assert_raises(ArgumentError) do GameBoard.new(nil) end
  end

  def test_initialize_board_will_set_default_nine_element_board
    mock_player_manager = MockPlayerManager.new
    game_board = GameBoard.new(mock_player_manager)
    expected_board_length = 9
    assert_equal(expected_board_length, game_board.board.length, "Expected default board to have 9 elements.")
  end
end
