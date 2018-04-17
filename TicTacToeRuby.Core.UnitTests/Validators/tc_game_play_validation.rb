require 'test/unit'
require_relative '../../TicTacToeRuby.Core/Validators/game_play_validator.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../Players/mock_player_manager.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

class GamePlayValidation < Test::Unit::TestCase
  
  attr_reader :game_board

  def setup
    board = [ "0", "1", "2",
              "3", "X", "5",
              "O", "X", "O" ]
    @game_board = GameBoard.new(board)
  end

  def test_evaluate_move_raises_a_nil_reference_error_when_game_board_is_nil
    assert_raises(NilReferenceError) do GamePlayValidator.evaluate_move(nil, "1") end
  end

  def test_evaluate_move_returns_two_elements
    result = GamePlayValidator.evaluate_move(@game_board, "1")
    expected_length = 2
    assert_equal(expected_length, result.length, "Expecting to receive two elements in the result set.")
  end

  def test_evaluate_move_returns_false_when_tile_is_occupied
    result = GamePlayValidator.evaluate_move(@game_board, "4")
    assert(!result.is_valid_move, "An occupied tile should not be a valid move to make.")
  end

  def test_evaluate_move_returns_false_when_tile_is_an_alpha_character
    result = GamePlayValidator.evaluate_move(@game_board, "X")
    assert(!result.is_valid_move, "An alpha character should not be a valid move to make.")
  end

  def test_evaluate_move_returns_false_when_tile_value_is_out_of_bounds
    result = GamePlayValidator.evaluate_move(@game_board, "10")
    assert(!result.is_valid_move, "An out-of-bounds value should not be a valid move to make.")
  end

  def test_evaluate_move_returns_true_when_tile_is_unoccupied
    result = GamePlayValidator.evaluate_move(@game_board, "0")
    assert(result.is_valid_move, "An unoccupied tile should be a valid move to make.")
  end

  def test_evaluate_move_returns_correct_index_when_tile_is_unoccupied
    result = GamePlayValidator.evaluate_move(@game_board, "0")
    assert_equal(0, result.index_of_board, "Unoccupied tile should set index in result set to expected value.")
  end

  def test_winning_game_raises_a_nil_reference_error_when_game_board_is_nil
    available_spaces = [0, 1]
    assert_raises(NilReferenceError) do GamePlayValidator.winning_game?("X", nil, available_spaces) end
  end

  def test_winning_game_raises_a_nil_reference_error_when_available_spaces_is_nil
    assert_raises(NilReferenceError) do GamePlayValidator.winning_game?("X", @game_board.board, nil) end
  end

  def test_winning_game_raises_an_invalid_value_error_when_player_symbol_is_invalid
    available_spaces = [0, 1]
    assert_raises(InvalidValueError) do GamePlayValidator.winning_game?("1", @game_board.board, available_spaces) end
  end

  def test_winning_game_returns_two_elements
    available_spaces = [0, 1, 2, 3, 5]
    result = GamePlayValidator.winning_game?("X", @game_board.board, available_spaces)
    expected_length = 2
    assert_equal(expected_length, result.length, "Expecting to receive two elements in the result set.")
  end

  def test_winning_game_returns_true_when_winning_move_can_be_made
    available_spaces = [0, 1]
    result = GamePlayValidator.winning_game?("X", @game_board.board, available_spaces)
    assert(result.is_valid_move, "Usage of 1 in available_spaces should result in a win and return true.")
  end

  def test_winning_game_returns_correct_index_when_winning_move_can_be_made
    available_spaces = [0, 1]
    result = GamePlayValidator.winning_game?("X", @game_board.board, available_spaces)
    assert_equal(1, result.index_of_board, "Usage of 1 in available_spaces should result in a win and return an index of 1.")
  end

  def test_winning_game_returns_false_when_winning_move_cannot_be_made
    available_spaces = [0, 5]
    result = GamePlayValidator.winning_game?("X", @game_board.board, available_spaces)
    assert(!result.is_valid_move, "Usage of given available_spaces should not result in a win and should return false.")
  end

  def test_winning_game_returns_negative_one_when_winning_move_cannot_be_made
    available_spaces = [0, 5]
    result = GamePlayValidator.winning_game?("X", @game_board.board, available_spaces)
    assert_equal(-1, result.index_of_board, "Usage of given available_spaces should not result in a win and should return index of -1.")
  end

  def test_winning_game_returns_false_when_available_spaces_is_empty
    available_spaces = []
    result = GamePlayValidator.winning_game?("X", @game_board.board, available_spaces)
    assert(!result.is_valid_move, "Usage of empty available_spaces should not result in a win and should return false.")
  end

end
