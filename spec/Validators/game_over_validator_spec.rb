require_relative '../../TicTacToeRuby.Core/Validators/game_over_validator.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'

RSpec.describe "a game over validator" do
  
  shared_examples "game_over?" do |description, board, expected|
    it "returns #{expected} when #{description}" do
      expect(GameOverValidator.game_over?(board)).to be expected
    end
  end

  context "method called game_over?" do
    it "raises an ArgumentError when board is nil" do
      expect{ GameOverValidator.game_over?(nil) }.to raise_error(ArgumentError)
    end
  
    include_examples "game_over?", "first row contains matching tiles", ["X", "X", "X", "X", "4", "5", "6", "7", "8", "9"], true
    include_examples "game_over?", "middle row contains matching tiles", ["1", "2", "3", "X", "X", "X", "7", "8", "9"], true
    include_examples "game_over?", "last row contains matching tiles", ["1", "2", "3", "4", "5", "6", "X", "X", "X"], true
    include_examples "game_over?", "first column contains matching tiles", ["X", "2", "3", "X", "5", "6", "X", "8", "9"], true
    include_examples "game_over?", "middle column contains matching tiles", ["1", "X", "3", "4", "X", "6", "7", "X", "9"], true
    include_examples "game_over?", "last column contains matching tiles", ["1", "2", "X", "4", "5", "X", "7", "8", "X"], true
    include_examples "game_over?", "left to right diagonal contains matching tiles", ["X", "2", "3", "4", "X", "6", "7", "8", "X"], true
    include_examples "game_over?", "right to left diagonal contains matching tiles", ["1", "2", "X", "4", "X", "6", "X", "8", "9"], true
    include_examples "game_over?", "there are no matching tiles on the board", ["1", "2", "3", "4", "X", "6", "X", "8", "9"], false
    include_examples "game_over?", "there are no played moves on the board yet", GameBoard.create_board, false
  end

  
end