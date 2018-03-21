require 'test/unit'
require_relative '../../TicTacToeRuby.Core/Validators/tie_game_validator.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'

class TestTieGameValidation < Test::Unit::TestCase
  def test_tie_game_raises_error_when_provided_board_is_nil
    assert_raises(ArgumentError) do TieGameValidator.tie_game?(nil) end
  end

  def test_tie_game_returns_false_on_brand_new_unplayed_board
    board = GameBoard.create_board
    assert(!TieGameValidator.tie_game?(board), "Expected false to be returned on unplayed board.")
  end

  def test_tie_game_happens_when_there_are_no_unoccupied_tiles_on_board_with_no_win
    board = []
    board << "Y" 
    board << "X" 
    board << "Y"
    board << "X" 
    board << "X" 
    board << "Y"
    board << "Y" 
    board << "Y" 
    board << "X"
    assert(TieGameValidator.tie_game?(board), "Expected detection of tie game.")
  end

  def test_tie_game_is_false_when_there_are_no_unoccupied_tiles_on_board_and_someone_won
    board = []
    board << "Y" 
    board << "X" 
    board << "Y"
    board << "Y" 
    board << "X" 
    board << "Y"
    board << "Y" 
    board << "Y" 
    board << "X"
    assert(!TieGameValidator.tie_game?(board), "Since player Y won, it is not a tie game.")
  end

  def test_tie_game_returns_false_when_there_is_an_unoccupied_tile_on_board
    board = []
    board << "X"
    board << "X"
    board << "3"
    board << "X"
    board << "Y"
    board << "Y"
    board << "Y"
    board << "Y"
    board << "Y"
    assert(!TieGameValidator.tie_game?(board), "Expected tie game to return false as there is one available tile on the board.")
  end
end
