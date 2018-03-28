require_relative '../../TicTacToeRuby.Core/Validators/game_play_validator.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core.UnitTests/Players/mock_player_manager.rb'

RSpec.describe "a game play validator" do
  context "method called evaluate_move" do
    it "raises an ArgumentError when game board is nil" do
      expect{ GamePlayValidator.evaluate_move(nil, "1") }.to raise_error(ArgumentError)
    end

  end
end