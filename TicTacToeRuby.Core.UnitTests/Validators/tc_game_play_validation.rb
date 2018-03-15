require 'test/unit'
require_relative '../../TicTacToeRuby.Core/Validators/game_play_validator.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../Players/mock_player_manager.rb'

class GamePlayValidation < Test::Unit::TestCase
  def test_evaluate_move_raises_an_argument_error_when_game_board_is_nil
    assert_raises(ArgumentError) do GamePlayValidator.evaluate_move(nil, "1") end
  end

  def test_evaluate_move_returns_two_elements
    player_manager = MockPlayerManager.new
    board = GameBoard.create_board
    game_board = GameBoard.new(player_manager, board)
    result = GamePlayValidator.evaluate_move(game_board, "1")
    expected_length = 2
    assert_equal(expected_length, result.length, "Expecting to receive two elements in the result set.")
  end

  def test_evaluate_move_returns_false_when_tile_is_occupied
    player_manager = MockPlayerManager.new
    board = [ "0", "1", "2",
              "3", "X", "5",
              "O", "X", "O" ]
    game_board = GameBoard.new(player_manager, board)
    result = GamePlayValidator.evaluate_move(game_board, "4")
    assert(!result.is_valid_move, "An occupied tile should not be a valid move to make.")
  end

  def test_evaluate_move_returns_false_when_tile_is_an_alpha_character
    player_manager = MockPlayerManager.new
    board = [ "0", "1", "2",
              "3", "X", "5",
              "O", "X", "O" ]
    game_board = GameBoard.new(player_manager, board)
    result = GamePlayValidator.evaluate_move(game_board, "X")
    assert(!result.is_valid_move, "An alpha character should not be a valid move to make.")
  end

  def test_evaluate_move_returns_false_when_tile_value_is_out_of_bounds
    player_manager = MockPlayerManager.new
    board = [ "0", "1", "2",
              "3", "X", "5",
              "O", "X", "O" ]
    game_board = GameBoard.new(player_manager, board)
    result = GamePlayValidator.evaluate_move(game_board, "10")
    assert(!result.is_valid_move, "An out-of-bounds value should not be a valid move to make.")
  end

  def test_evaluate_move_returns_true_when_tile_is_unoccupied
    player_manager = MockPlayerManager.new
    board = [ "0", "1", "2",
              "3", "X", "5",
              "O", "X", "O" ]
    game_board = GameBoard.new(player_manager, board)
    result = GamePlayValidator.evaluate_move(game_board, "0")
    assert(result.is_valid_move, "An unoccupied tile should be a valid move to make.")
  end


  def test_evaluate_move_returns_correct_index_when_tile_is_unoccupied
    player_manager = MockPlayerManager.new
    board = [ "0", "1", "2",
              "3", "X", "5",
              "O", "X", "O" ]
    game_board = GameBoard.new(player_manager, board)
    result = GamePlayValidator.evaluate_move(game_board, "0")
    assert_equal(0, result.index_of_board, "Unoccupied tile should set index in result set to expected value.")
  end
end
