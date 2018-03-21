require 'test/unit'
require_relative '../../TicTacToeRuby.Core/GamePlay/computer_actions.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/computer_actions.rb'
require_relative '../Players/mock_player_manager.rb'

class TestComputerActions < Test::Unit::TestCase
  BEST_MAX_MOVE = -20000
  BEST_MIN_MOVE =  20000

  attr_reader :computer_actions, :game_board

  def create_computer_actions(new_board)
    players = MockPlayerManager.new
    @game_board = GameBoard.new(players, new_board)
    @computer_actions = ComputerActions.new(@game_board)
  end

  def test_get_best_move_raises_argument_error_when_board_is_nil
    new_board = [ "X", "O", "X",
                  "X", "5", "O",
                  "O", "X", "X" ]
    create_computer_actions(new_board)
    assert_raises(ArgumentError) do
      @computer_actions.get_best_move(nil, "X", 0, BEST_MAX_MOVE, BEST_MIN_MOVE)
    end
  end

  def test_get_best_move_raises_argument_error_when_player_symbol_is_not_valid
    new_board = [ "X", "O", "X",
                  "X", "5", "O",
                  "O", "X", "X" ]
    create_computer_actions(new_board)
    assert_raises(ArgumentError) do
      @computer_actions.get_best_move(nil, " ", 0, BEST_MAX_MOVE, BEST_MIN_MOVE)
    end
  end

  def test_get_best_move_returns_index_of_negative_one_when_there_are_no_next_moves_to_make
    new_board = [ "X", "O", "X",
                  "X", "X", "O",
                  "O", "X", "X" ]
    create_computer_actions(new_board)
    expected_move_index = -1
    actual_move = @computer_actions.get_best_move(new_board, "X", 1, BEST_MAX_MOVE, BEST_MIN_MOVE)
    actual_move_index = actual_move.index
    assert_equal(expected_move_index, actual_move_index)
  end

  def test_get_best_move_returns_index_of_negative_one_when_depth_is_zero
    new_board = [ "X", "O", "X",
                  "X", "5", "O",
                  "O", "X", "X" ]
    create_computer_actions(new_board)
    expected_move_index = -1
    actual_move = @computer_actions.get_best_move(new_board, "X", 0, BEST_MAX_MOVE, BEST_MIN_MOVE)
    actual_move_index = actual_move.index
    assert_equal(expected_move_index, actual_move_index)
  end

  def test_get_best_move_returns_correct_spot_when_one_move_results_in_a_winning_game_for_computer
    new_board = [ "X", "O", "X",
                  "X", "5", "O",
                  "O", "O", "X" ]
    create_computer_actions(new_board)
    expected_index = 4
    actual_move = @computer_actions.get_best_move(new_board, "O", 5, BEST_MAX_MOVE, BEST_MIN_MOVE)
    actual_index = actual_move.index
    assert_equal(expected_index, actual_index)
  end

  def test_get_best_move_returns_correct_spot_when_one_move_is_left_to_play
    new_board = [ "X", "O", "X",
                  "X", "5", "O",
                  "O", "X", "X" ]
    create_computer_actions(new_board)
    expected_index = 4
    actual_move = @computer_actions.get_best_move(new_board, "O", 5, BEST_MAX_MOVE, BEST_MIN_MOVE)
    actual_index = actual_move.index
    assert_equal(expected_index, actual_index)
  end

  [
    ["1", ["X", "O", "3",
           "X", "5", "O",
           "O", "O", "X" ], "O", 4],     
    ["2", ["1", "O", "3",
           "4", "5", "O",
           "7", "O", "X" ], "O", 4],
    ["3", ["1", "O", "3",
           "O", "5", "O",
           "7", "O", "X" ], "O", 4],
    ["4", ["1", "X", "3",
           "X", "5", "O",
           "7", "X", "O" ], "O", 2],
    ["5", ["1", "X", "3",
           "O", "5", "O",
           "O", "X", "9" ], "O", 4],
    ["6", ["1", "X", "3",
           "X", "5", "6",
           "7", "O", "O" ], "O", 6],
    ["7", ["1", "X", "O",
           "X", "5", "6",
           "7", "X", "O" ], "O", 5],
    ["8", ["O", "2", "X",
           "4", "X", "6",
           "O", "8", "X" ], "O", 3],
    ["9", ["O", "2", "O",
           "4", "5", "X",
           "7", "X", "9" ], "O", 1],
    ["10", ["O", "2", "3",
            "4", "O", "6",
            "7", "8", "9" ], "O", 8],
    ["11", ["1", "2", "O",
           "4", "5", "6",
           "O", "8", "9" ], "O", 4]
  ].each do |scenario, board, player_symbol, expected_index|
    test_name = "test_when_there_are_multiple_moves_to_make_then_index_resulting_in_a_win_is_returned_in_scenario_" + scenario
    define_method(test_name) { 
      create_computer_actions(board)
      depth = 5
      actual_index = @computer_actions.get_best_move(board, player_symbol, depth, BEST_MAX_MOVE, BEST_MIN_MOVE).index
      assertion_failure_message = "get_best_move did not return expected index for scenario " + scenario
      assert_equal(expected_index, actual_index, assertion_failure_message) 
    }
  end

  [
    ["1", ["1", "X", "3",
           "X", "5", "O",
           "O", "X", "9" ], "O", 4],
    ["2", ["O", "X", "3",
           "4", "X", "6",
           "7", "8", "O" ], "O", 7],
    ["3", ["1", "2", "O",
           "4", "X", "6",
           "7", "X", "9" ], "O", 1],
    ["4", ["X", "2", "3",
           "4", "5", "6",
           "X", "8", "9" ], "O", 3],
    ["5", ["X", "2", "3",
           "4", "5", "6",
           "7", "8", "X" ], "O", 4],
    ["6", ["1", "2", "3",
           "4", "5", "6",
           "X", "8", "X" ], "O", 7],
    ["7", ["1", "2", "X",
           "4", "5", "6",
           "7", "8", "X" ], "O", 5],
    ["8", ["X", "2", "O",
           "4", "5", "6",
           "X", "8", "9" ], "O", 3],
    ["9", ["O", "X", "O",
           "X", "X", "O",
           "7", "O", "9" ], "X", 8]
    ].each do |scenario, board, player_symbol, expected_index|
    test_name = "test_blocking_action_is_chosen_correctly_for_scenario_" + scenario
    define_method(test_name){
      create_computer_actions(board)
      depth = 5
      assertion_failure_message = "Expected index to match blocking action for scenario " + scenario
      actual_index = @computer_actions.get_best_move(board, player_symbol, depth, BEST_MAX_MOVE, BEST_MIN_MOVE).index
      assert_equal(expected_index, actual_index, assertion_failure_message)  
    } 
  end
end
