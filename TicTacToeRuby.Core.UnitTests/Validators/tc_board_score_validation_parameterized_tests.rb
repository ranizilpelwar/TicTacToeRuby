require 'test/unit'
require_relative '../../TicTacToeRuby.Core/Validators/board_score_validator.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'

class BoardScoreValidationParameterizedTests < Test::Unit::TestCase
  [
    # +100 for every 3 in one line for current/computer player.
    ["1", ["O", "O", "O",
           "O", "5", "O",
           "7", "O", "X" ], [0, 1, 2], 100], 
    # +10 for EACH 2-in-a-line (with an unoccupied spot) for computer.
    ["2", ["1", "O", "O",
           "O", "5", "O",
           "7", "O", "X" ], [0, 1, 2], 10],  
    # +1 for EACH 1-in-a-line(with two unoccupied spots) for computer.
    ["3", ["1", "O", "3",
           "O", "5", "O",
           "7", "O", "X" ], [0, 1, 2], 1],
    ["4", ["1", "2", "O",
           "O", "5", "O",
           "7", "O", "X" ], [0, 1, 2], 1],  
    # Negative scores for opponent, -100 for every 3 in one line for other player.
    ["5", ["X", "X", "X",
           "O", "5", "O",
           "7", "O", "X" ], [0, 1, 2], -100],
    # Negative scores for opponent, -10 for every 2-in-a-line (with an unoccupied spot) for other player.
    ["6", ["1", "X", "X",
           "O", "5", "O",
           "7", "O", "X" ], [0, 1, 2], -10],    
    # Negative scores for opponent, -1 for EACH 1-in-a-line(with two unoccupied spots) for other player.
    ["7", ["1", "X", "3",
           "O", "5", "O",
           "7", "O", "X" ], [0, 1, 2], -1],
    ["8", ["1", "2", "X",
           "O", "5", "O",
           "7", "O", "X" ], [0, 1, 2], -1],
    # 0 (empty lines or lines with both computer's and opponent's symbols).
    ["9", ["1", "2", "3",
           "O", "5", "O",
           "7", "O", "X" ], [0, 1, 2], 0],
    ["10", ["X", "O", "X",
           "O", "5", "O",
           "7", "O", "X" ], [0, 1, 2], 0]       
  ].each do |scenario, board, indexes, expected_score|
    test_name = "test_expected_score_of_line_is_returned_in_scenario_" + scenario
    define_method(test_name) { 
      actual_score = BoardScoreValidator.evaluate_score_of_line(board, indexes, "O", "X")
      assertion_failure_message = "Line score did not match expected results for scenario " + scenario
      assert_equal(expected_score, actual_score, assertion_failure_message) 
    }
  end

 [
  ["1", ["O", "O", "O",
         "O", "5", "O",
         "7", "O", "X" ], 131],
  ["2", ["1", "O", "O",
         "O", "5", "O",
         "7", "O", "X" ], 31],
  ["3", ["1", "O", "3",
         "O", "5", "O",
         "7", "O", "X" ], 21],
  ["4", ["1", "2", "O",
         "O", "5", "O",
         "7", "O", "X" ], 13],
  ["5", ["X", "X", "X",
         "O", "5", "O",
         "7", "O", "X" ], -101],
  ["6", ["1", "X", "X",
         "O", "5", "O",
         "7", "O", "X" ], -1],
  ["7", ["1", "X", "3",
         "O", "5", "O",
         "7", "O", "X" ], 9],
  ["8", ["1", "2", "X",
         "O", "5", "O",
         "7", "O", "X" ], 9],
  ["9", ["1", "2", "3",
         "O", "5", "O",
         "7", "O", "X" ], 11],
  ["10", ["X", "O", "X",
         "O", "5", "O",
         "7", "O", "X" ], 9]                  
  ].each do |scenario, board, expected_score|
    test_name = "test_expected_score_of_board_is_returned_in_scenario_" + scenario
    define_method(test_name) { 
      actual_score = BoardScoreValidator.evaluate_score_of_board(board, "O", "X")
      assertion_failure_message = "Board score did not match expected results for scenario " + scenario
      assert_equal(expected_score, actual_score, assertion_failure_message) 
    }
  end
end

