require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'

When("a human wants to play the game") do
  @type = :Human
  @player_type = PlayerType.new(@type)
end

Then("they can") do
  @player = Player.new(@player_type, "X")
  expect(@player_type.selected_option).to eq(@type)
end

When("a computer wants to play the game") do
  @type = :Computer
  @player_type = PlayerType.new(@type)
end

When("a dog wants to play the game") do
  @type = :Dog
end

Then("they cannot") do
  expect{ @player_type = PlayerType.new(@type) }.to raise_error(InvalidValueError)
end
