Given("a game is being played with a computer player") do
  @player_manager = MockPlayerManager.new
	@computer_player_symbol = "X"
end

Given("selecting square 5 can result in a win for the computer player") do
  @new_board = [ "X", "O", "X", "X", "5", "O", "O", "O", "X" ]
  @game_board = GameBoard.new(@player_manager, @new_board)
	@computer_actions = ComputerActions.new(@game_board)
  @best_max_move = -20000
	@best_min_move = 20000
	@depth = 5
end

When("the computer player makes a move") do
  @actual_computer_move = @computer_actions.get_best_move(@new_board, @computer_player_symbol, @depth, @best_max_move, @best_min_move)
end

Then("the move matches square {int} on the board") do |int|
  index = int - 1 
	expect(@actual_computer_move.index).to eq(index)
end
