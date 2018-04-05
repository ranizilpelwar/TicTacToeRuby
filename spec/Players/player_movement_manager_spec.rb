require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_movement_manager.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'

RSpec.describe "a player movement manager" do
  before(:example) do
    @player1_type = PlayerType.new(:Human)
    @player2_type = PlayerType.new(:Computer)
    @type_of_match = MatchType.new(@player1_type, @player2_type)
    @player_movement_manager = PlayerMovementManager.new(@type_of_match)
  end

  context "initialization" do
    it "raises a NilReferenceError when type of match is nil" do
      type_of_match = nil
      expect{ PlayerMovementManager.new(type_of_match) }.to raise_error(NilReferenceError)
    end

    it "sets last move of player1 to -1" do
      expect(@player_movement_manager.player1_last_move).to eq(-1)
    end

    it "sets last move of player2 to -1" do
      expect(@player_movement_manager.player2_last_move).to eq(-1)
    end

    it "sets match type to provided value when it is valid" do
      expect(@player_movement_manager.match_type).to eq(@type_of_match)
    end
  end

  context "method called get_last_move_for_player" do
    it "raises an InvalidValueError when player number is 0" do
      expect{@player_movement_manager.get_last_move_for_player(0)}.to raise_error(InvalidValueError)
    end

    it "raises an InvalidValueError when player number is -1" do
      expect{@player_movement_manager.get_last_move_for_player(-1)}.to raise_error(InvalidValueError)
    end

    it "raises an InvalidValueError when player number is 3" do
      expect{@player_movement_manager.get_last_move_for_player(3)}.to raise_error(InvalidValueError)
    end

    it "returns last move for player1 when player number is set to 1" do
      player_number = 1
      updated_move = 5
      @player_movement_manager.update_last_move_for_player(player_number, updated_move)
      expect(@player_movement_manager.get_last_move_for_player(player_number)).to eq(updated_move)
    end

    it "returns last move for player2 when player number is set to 2" do
      player_number = 2
      updated_move = 5
      @player_movement_manager.update_last_move_for_player(player_number, updated_move)
      expect(@player_movement_manager.get_last_move_for_player(player_number)).to eq(updated_move)
    end

    it "updates last move when move is 0" do
      player_number = 1
      move = 0
      @player_movement_manager.update_last_move_for_player(player_number, move)
      expect(@player_movement_manager.get_last_move_for_player(player_number)).to eq(move)
    end

    it "updates last move when move is the same as the largest index" do
      player_number = 1
      move = PlayerMovementManager::LARGEST_INDEX
      @player_movement_manager.update_last_move_for_player(player_number, move)
      expect(@player_movement_manager.get_last_move_for_player(player_number)).to eq(move)
    end
  end
end