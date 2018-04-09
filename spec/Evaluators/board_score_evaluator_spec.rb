require_relative '../../TicTacToeRuby.Core/Evaluators/board_score_evaluator.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

RSpec.describe "a board score evaluator" do
  context "method called score_of_board" do
    it "raises a NilReferenceError when board is nil" do
      expect{ BoardScoreEvaluator.score_of_board(nil, "X", "Y") }.to raise_error(NilReferenceError)
    end

    it "raises an InvalidValueError when symbol of current player is invalid" do
      board = GameBoard.create_board
      expect{ BoardScoreEvaluator.score_of_board(board, "1", "Y") }.to raise_error(InvalidValueError)
    end

    it "raises an InvalidValueError when symbol of other player is invalid" do
      board = GameBoard.create_board
      expect{ BoardScoreEvaluator.score_of_board(board, "X", "1") }.to raise_error(InvalidValueError)
    end
  end

  shared_examples "score of line" do |scenario, board, indexes, expected_score|
    it "returns expected score for scenario #{scenario}" do
      actual_score = BoardScoreEvaluator.score_of_line(board, indexes, "O", "X")
      expect(actual_score).to eq(expected_score)
    end
  end

  context "method called score_of_line" do
    it "raises a NilReferenceError when board is nil" do
      expect{ BoardScoreEvaluator.score_of_line(nil, [], "X", "Y") }.to raise_error(NilReferenceError)
    end

    it "raises a NilReferenceError when indexes is nil" do
      board = GameBoard.create_board
      expect{ BoardScoreEvaluator.score_of_line(board, nil, "X", "Y") }.to raise_error(NilReferenceError)
    end

    it "raises an InvalidValueError when symbol of current player is invalid" do
      board = GameBoard.create_board
      expect{ BoardScoreEvaluator.score_of_line(board, [], "1", "Y") }.to raise_error(InvalidValueError)
    end

    it "raises an InvalidValueError when symbol of other player is invalid" do
      board = GameBoard.create_board
      expect{ BoardScoreEvaluator.score_of_line(board, [], "X", "1") }.to raise_error(InvalidValueError)
    end

    include_examples "score of line", 1, ["O", "O", "O", "O", "5", "O", "7", "O", "X"], [0, 1, 2], 100
    include_examples "score of line", 2, ["1", "O", "O", "O", "5", "O", "7", "O", "X" ], [0, 1, 2], 10
    include_examples "score of line", 3, ["1", "O", "3", "O", "5", "O", "7", "O", "X" ], [0, 1, 2], 1
    include_examples "score of line", 4, ["1", "2", "O", "O", "5", "O", "7", "O", "X" ], [0, 1, 2], 1
    include_examples "score of line", 5, ["X", "X", "X", "O", "5", "O", "7", "O", "X" ], [0, 1, 2], -100
    include_examples "score of line", 6, ["1", "X", "X", "O", "5", "O", "7", "O", "X" ], [0, 1, 2], -10
    include_examples "score of line", 7, ["1", "X", "3", "O", "5", "O", "7", "O", "X" ], [0, 1, 2], -1
    include_examples "score of line", 8, ["1", "2", "X", "O", "5", "O", "7", "O", "X" ], [0, 1, 2], -1
    include_examples "score of line", 9, ["1", "2", "3", "O", "5", "O", "7", "O", "X" ], [0, 1, 2], 0
    include_examples "score of line", 10, ["X", "O", "X", "O", "5", "O", "7", "O", "X" ], [0, 1, 2], 0
  end

  shared_examples "score of board" do |scenario, board, expected_score|
    it "returns expected score for scenario #{scenario}" do
      actual_score = BoardScoreEvaluator.score_of_board(board, "O", "X")
      expect(actual_score).to eq(expected_score)
    end
  end

  describe "method called score_of_board" do 
    include_examples "score of board", 1, ["O", "O", "O", "O", "5", "O", "7", "O", "X"], 131
    include_examples "score of board", 2, ["1", "O", "O", "O", "5", "O", "7", "O", "X"], 31
    include_examples "score of board", 3, ["1", "O", "3", "O", "5", "O", "7", "O", "X"], 21
    include_examples "score of board", 4, ["1", "2", "O", "O", "5", "O", "7", "O", "X"], 13
    include_examples "score of board", 5, ["X", "X", "X", "O", "5", "O", "7", "O", "X"], -101
    include_examples "score of board", 6, ["1", "X", "X", "O", "5", "O", "7", "O", "X"], -1
    include_examples "score of board", 7, ["1", "X", "3", "O", "5", "O", "7", "O", "X"], 9
    include_examples "score of board", 8, ["1", "2", "X", "O", "5", "O", "7", "O", "X"], 9
    include_examples "score of board", 9, ["1", "2", "3", "O", "5", "O", "7", "O", "X"], 11
    include_examples "score of board", 10, ["X", "O", "X", "O", "5", "O", "7", "O", "X"], 9
  end
end