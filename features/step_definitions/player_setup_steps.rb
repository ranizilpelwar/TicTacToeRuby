require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_manager.rb'

Given("a new game is started") do
  @players = []
end

Given("player {int} is set up with symbol {string}") do |int, string|
  player = Player.new(PlayerType.new(:Human), string)
  @players << player
end

Then("player setup displays an error") do
  expect {PlayerManager.new(@players[0], @players[1])}.to raise_error(InvalidValueError)
end

Then("player setup is successful") do
  player_manager = PlayerManager.new(@players[0], @players[1])
  expect(!player_manager.nil?).to be true
end

When("the user selects player with symbol {string} to go first") do |string|
  @selection_for_first_player = string
end

Then("that player can go first in the game") do
	expect(PlayerSelectionValidator.valid?(@selection_for_first_player, @players[0].symbol, @players[1].symbol)).to be true
end

Then("that player cannot go first in the game") do
	expect(PlayerSelectionValidator.valid?(@selection_for_first_player, @players[0].symbol, @players[1].symbol)).to be false
end
