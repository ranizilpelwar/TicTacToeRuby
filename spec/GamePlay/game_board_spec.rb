require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core.UnitTests/Players/mock_player_manager.rb'

RSpec.describe "a game board" do  
  before(:example) do
    @board = GameBoard.create_board
    @player_manager = MockPlayerManager.new
    @game_board = GameBoard.new(@player_manager, @board)
  end

  context "create board" do
    it "will create a nine element board" do
      expect(@board.length).to eq(9)
    end
  end

  context "initialize" do
    it "will raise an ArgumentError when player manager is nil" do
      expect{ GameBoard.new(nil) }.to raise_error(ArgumentError)
    end

    it "will set the board to the provided parameter" do
      expect(@game_board.board).to eq(@board)
    end

    it "will set the player manager to the provided parameter" do
      expect(@game_board.player_manager).to eq(@player_manager)
    end
  end

  context "update board" do
    it "will raise an ArgumentError when the game piece is nil" do
      expect{ @game_board.update_board(0, nil) }.to raise_error(ArgumentError)
    end

    it "will raise an ArgumentError when the index is the length of the board" do
      expect{ @game_board.update_board(9, "X") }.to raise_error(ArgumentError)
    end

    it "will raise an ArgumentError when the index is greater than the length of the board" do
      expect { @game_board.update_board(11, "X") }.to raise_error(ArgumentError)
    end

    it "will raise an ArgumentError when the index is negative" do
      expect { @game_board.update_board(-1, "X") }.to raise_error(ArgumentError)
    end

    it "will update a location on the board with the provided symbol" do
      index_on_board = 0
      player_symbol = "X"
      @game_board.update_board(index_on_board, player_symbol)
      stored_symbol_at_index = @game_board.board[index_on_board]
      expect(stored_symbol_at_index).to eq(player_symbol)
    end

    it "will only update the provided location on the board" do
      expected_board = ["X", "2", "3", "4", "5", "6", "7", "8", "9"]    
      @game_board.update_board(0, "X")
      result = @game_board.board - expected_board
      expect(result).to eq([])
    end
  end

  context "revert board" do
    it "will raise an ArgumentError when the index is the length of the board" do
      expect{ @game_board.revert_board(9, "X") }.to raise_error(ArgumentError)
    end

    it "will raise an ArgumentError when the index is greater than the length of the board" do
      expect{ @game_board.revert_board(11, "X") }.to raise_error(ArgumentError)
    end

    it "will raise an ArgumentError when the index is negative" do
      expect{ @game_board.revert_board(-1, "X") }.to raise_error(ArgumentError)
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