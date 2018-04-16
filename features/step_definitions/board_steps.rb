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
		@game_board.revert_board(int - 1)
	end

	When("player with symbol {string} selects square {int}") do |string, int|
    index = int.to_i - 1	
		@game_board.update_board(index, string)
	end

	Then("square {int} is updated to display the symbol {string}") do |int, string|
  	index = int.to_i - 1
		expect(@game_board.tile(index)).to eq(string)		
	end
