require 'test/unit'
require_relative '../../TicTacToeRuby.Core/Validators/game_play_validator.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../Players/mock_player_manager.rb'

class GamePlayValidation < Test::Unit::TestCase
  def test_evaluate_move_raises_an_argument_error_when_game_board_is_nil
    assert_raises(ArgumentError) do GamePlayValidator.evaluate_move(nil, "1") end
  end

  def test_evaluate_move_returns_a_two_element_array
    player_manager = MockPlayerManager.new
    board = GameBoard.create_board
    game_board = GameBoard.new(player_manager, board)
    result = GamePlayValidator.evaluate_move(game_board, "1")
    expected_length = 2
    assert_equal(expected_length, result.length, "Expecting to receive a two element array.")
  end
end
