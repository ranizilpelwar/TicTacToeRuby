require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core.UnitTests/Players/mock_player_manager.rb'

	When("the board is displayed") do
		@player_manager_double = MockPlayerManager.new
		@game_board_default = GameBoard.new(@player_manager_double, GameBoard.create_board)
	end

	Then("the board should have {int} total squares") do |int|
		expect(@game_board_default.board.size).to eq(int)
	end


