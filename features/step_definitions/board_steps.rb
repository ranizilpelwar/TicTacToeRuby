require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core.UnitTests/Players/mock_player_manager.rb'

	When("the board is displayed") do
		@player_manager_double = MockPlayerManager.new
		@game_board = GameBoard.new(@player_manager_double, GameBoard.create_board)
	end

	Then("the board should have {int} total squares") do |int|
		expect(@game_board.board.size).to eq(int)
	end

	Then("square {int} displays the number {int}") do |square, value|
		expect(@game_board.board[square.to_i - 1]).to eq(value.to_s)
	end

Given("square {int} on the board is unoccupied") do |int|
	  pending # Write code here that turns the phrase above into concrete actions
end
