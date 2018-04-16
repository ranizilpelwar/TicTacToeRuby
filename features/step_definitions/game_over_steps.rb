When("all spaces are occupied with no tic tac toe configuration on the board") do
  @board = ["X", "X", "Y", "Y", "Y", "X", "X", "X", "Y"]
end

Then("the game has ended in a tie") do
	expect(TieGameValidator.tie_game?(@board)).to be true
end

When("there are three squares in a single row on the board, all occupied by player symbol {string}") do |string|
  @board = [string, string, string, "4", "5", "6", "7", "8", "9"]
end

Then("the player with a symbol {string} has won the game") do |string|
  expect(GameOverValidator.win_for_player?(string, @board)).to eq(true)
end

Then("the game is over") do
	expect(GameOverValidator.game_over?(@board)).to eq(true)
end

When("there are three squares in a single column on the board, all occupied by player symbol {string}") do |string|
  @board = [string, "2", "3", string, "5", "6", string, "8", "9"]
end

When("there are three squares in a left-to-right diagonal on the board, all occupied by a player symbol {string}") do |string|
  @board = [string, "2", "3", "4", string, "6", "7", "8", string]
end

When("there are three squares in a right-to-left	diagonal on the board, all occupied by a player symbol {string}") do |string|
  @board = ["1", "2", string, "4", string, "6", string, "8", "9"]
end
