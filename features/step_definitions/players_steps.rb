require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'

Given("there is a human") do
  @type1 = PlayerType.new(:Human)
end

When("the person plays the game") do
  @player1 = Player.new(@type1, "X")
  @match_manager = MatchTypeManager.new	
end

Then("the second player is a computer") do
	expect(@match_manager.get_match_type(2).player2_type.selected_option).to eq(:Computer)
end

Given("there are two people that want to play") do
	@type1 = PlayerType.new(:Human)
	@type2 = PlayerType.new(:Human)
end

When("they play the game") do
  @player1 = Player.new(@type1, "X")
	@player2 = Player.new(@type2, "Y")
	@match_manager = MatchTypeManager.new
end

Then("they play against each other") do
  expect(@match_manager.get_match_type(1).player1_type.selected_option).to eq(:Human)
	expect(@match_manager.get_match_type(1).player2_type.selected_option).to eq(:Human)
end

Given("there is no one to join the game") do
	  pending # Write code here that turns the phrase above into concrete actions
end

When("the game is played") do
	  pending # Write code here that turns the phrase above into concrete actions
end

Then("both players are of type computer") do
	  pending # Write code here that turns the phrase above into concrete actions
end

