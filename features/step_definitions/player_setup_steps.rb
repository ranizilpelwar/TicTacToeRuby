require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_manager.rb'

Given("a new game is started") do
  @players = []
end

Given("player {int} is setup with symbol {string}") do |int, string|
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