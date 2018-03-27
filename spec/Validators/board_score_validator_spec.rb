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
  end
end