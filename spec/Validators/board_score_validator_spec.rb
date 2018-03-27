require_relative '../../TicTacToeRuby.Core/Validators/board_score_validator.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'

RSpec.describe "a board score validator" do
  context "method called evaluate_score_of_board" do
    it "raises an ArgumentError when board is nil" do
      expect{ BoardScoreValidator.evaluate_score_of_board(nil, "X", "Y") }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when symbol of current player is invalid" do
      board = GameBoard.create_board
      expect{ BoardScoreValidator.evaluate_score_of_board(board, "1", "Y") }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when symbol of other player is invalid" do
      board = GameBoard.create_board
      expect{ BoardScoreValidator.evaluate_score_of_board(board, "X", "1") }.to raise_error(ArgumentError)
    end
  end

  shared_examples "score of line" do |scenario, board, indexes, expected_score|
    it "returns expected score for scenario #{scenario}" do
      actual_score = BoardScoreValidator.evaluate_score_of_line(board, indexes, "O", "X")
      expect(actual_score).to eq(expected_score)
    end
  end

  context "method called evaluate_score_of_line" do
    it "raises an ArgumentError when board is nil" do
      expect{ BoardScoreValidator.evaluate_score_of_line(nil, [], "X", "Y") }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when indexes is nil" do
      board = GameBoard.create_board
      expect{ BoardScoreValidator.evaluate_score_of_line(board, nil, "X", "Y") }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when symbol of current player is invalid" do
      board = GameBoard.create_board
      expect{ BoardScoreValidator.evaluate_score_of_line(board, [], "1", "Y") }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when symbol of other player is invalid" do
      board = GameBoard.create_board
      expect{ BoardScoreValidator.evaluate_score_of_line(board, [], "X", "1") }.to raise_error(ArgumentError)
    end

    include_examples "score of line", "1", ["O", "O", "O", "O", "5", "O", "7", "O", "X"], [0, 1, 2], 100
    
  end


end