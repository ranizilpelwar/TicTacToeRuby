require_relative '../../TicTacToeRuby.Core/Players/player.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_manager.rb'

RSpec.describe "a player manager" do
  before(:example) do
    @player1 = Player.new(:Human, "X")
    @player2 = Player.new(:Computer, "Y")
    @player_manager = PlayerManager.new(@player1, @player2)
  end

  context "intialization" do
    it "sets player1 to the given value" do
      expect(@player_manager.player1).to eq(@player1)
    end
  end

  context "method called get_next_player" do
    it "returns the correct next player" do
      player = @player_manager.get_next_player
      expect(player).to eq(@player2)
    end

    it "does not update the current player" do
      player = @player_manager.get_next_player
      expect(@player_manager.current_player).to eq(@player1)
    end
  end

  context "method called update_current_player" do
    it "returns the correct player" do
      player = @player_manager.update_current_player
      expect(player).to eq(@player2)
    end

    it "updates the current player" do
      player = @player_manager.update_current_player
      expect(@player_manager.current_player).to eq(@player2)
    end
  end

  context "method called get_player_number" do
    it "returns 1 when player1 is provided" do
      expect(@player_manager.get_player_number(@player1)).to eq(1)
    end

    it "returns 2 when player2 is provided" do
      expect(@player_manager.get_player_number(@player2)).to eq(2)
    end

    it "returns -1 when player cannot be found" do
      player = Player.new(:Human, "O")
      expect(@player_manager.get_player_number(player)).to eq(-1)
    end

    it "raises an ArgumentError when player is nil" do
      expect{@player_manager.get_player_number(nil)}.to raise_error(ArgumentError)
    end
  end
end