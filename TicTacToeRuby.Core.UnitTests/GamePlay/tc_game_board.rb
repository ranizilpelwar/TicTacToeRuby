require 'test/unit'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../Players/mock_player_manager.rb'

class TestGameBoard < Test::Unit::TestCase

  attr_reader :game_board, :board, :player_manager
  def setup
    @board = GameBoard.create_board
    @player_manager = MockPlayerManager.new
    @game_board = GameBoard.new(@player_manager, @board)
  end

  def test_initialize_will_raise_an_exception_when_player_manager_is_nil
    assert_raises(ArgumentError) do GameBoard.new(nil) end
  end

  def test_create_board_will_create_a_nine_element_board
    expected_board_length = 9
    assert_equal(expected_board_length, @board.length, "Expected default board to have 9 elements.")
  end

  def test_initialize_will_set_the_board_to_the_provided_parameter
    assert_equal(@board, @game_board.board, "Expected game board's board to match provided board.")
  end

  def test_initialize_will_set_the_player_manager_to_the_provided_parameter
    assert_equal(@player_manager, @game_board.player_manager, 
      "Expected game board's player manager to match the provided one.")
  end

  def test_update_board_raises_argument_error_when_game_piece_is_nil
    assert_raises(ArgumentError) do @game_board.update_board(0, nil) end
  end

  def test_update_board_raises_argument_error_when_index_is_length_of_board
    assert_raises(ArgumentError) do @game_board.update_board(9, @board) end
  end

  def test_update_board_raises_argument_error_when_index_is_greater_than_length_of_board
    assert_raises(ArgumentError) do @game_board.update_board(-1, @board) end
  end

end
