require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core.UnitTests/Players/mock_player_manager.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

RSpec.describe "a game board" do  
  before(:example) do
    @board = GameBoard.create_board
    @game_board = GameBoard.new(@board)
  end

  context "method called create board" do
    it "creates a nine element board" do
      expect(@board.length).to eq(9)
    end
  end

  context "initialization" do
    it "sets the board to the provided parameter" do
      expect(@game_board.board).to eq(@board)
    end
  end

  context "method called update board" do
    it "raises a NilReferenceError when the game piece is nil" do
      expect{ @game_board.update_board(0, nil) }.to raise_error(NilReferenceError)
    end

    it "raises an InvalidValueError when the index is the length of the board" do
      expect{ @game_board.update_board(9, "X") }.to raise_error(InvalidValueError)
    end

    it "raises an InvalidValueError when the index is greater than the length of the board" do
      expect { @game_board.update_board(11, "X") }.to raise_error(InvalidValueError)
    end

    it "raises an InvalidValueError when the index is negative" do
      expect { @game_board.update_board(-1, "X") }.to raise_error(InvalidValueError)
    end

    it "updates a location on the board with the provided symbol" do
      index_on_board = 0
      player_symbol = "X"
      @game_board.update_board(index_on_board, player_symbol)
      stored_symbol_at_index = @game_board.board[index_on_board]
      expect(stored_symbol_at_index).to eq(player_symbol)
    end

    it "updates only the provided location on the board" do
      expected_board = ["X", "2", "3", "4", "5", "6", "7", "8", "9"]    
      @game_board.update_board(0, "X")
      result = @game_board.board - expected_board
      expect(result).to eq([])
    end
  end

  context "method called revert board" do
    it "raises an InvalidValueError when the index is the length of the board" do
      expect{ @game_board.revert_board(9) }.to raise_error(InvalidValueError)
    end

    it "raises an InvalidValueError when the index is greater than the length of the board" do
      expect{ @game_board.revert_board(11) }.to raise_error(InvalidValueError)
    end

    it "raises an InvalidValueError when the index is negative" do
      expect{ @game_board.revert_board(-1) }.to raise_error(InvalidValueError)
    end

    it "reverts only the provided location on the board" do
      # first, update the board
      @game_board.update_board(0, "X")
      # then, revert the board
      expected_board = GameBoard.create_board
      @game_board.revert_board(0)
      result = @game_board.board - expected_board
      expect(result).to eq([])
    end
  end
end