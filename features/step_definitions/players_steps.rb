require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'

Then("it can") do
  @player = Player.new(@player_type, "X")
  expect(@player_type.selected_option).to eq(@type)
end

When(/a (Human|Computer) wants to play the game/) do |type|
  @type = type.to_sym
  @player_type = PlayerType.new(@type)
end

Given("only a Computer is available to play") do
  @type = :Computer
  @player_type = PlayerType.new(@type)
end

When("a Dog wants to play the game") do
  @type = :Dog
end

Then("it cannot") do
  expect{ @player_type = PlayerType.new(@type) }.to raise_error(InvalidValueError)
end

When(/(\A[^0-9\s]{1}) is selected as a symbol\Z/) do |character|
  @character = character
  @player = Player.new(PlayerType.new(:Human), character)
end

Then("it can be used as a symbol") do
  expect(@player.symbol.upcase).to eq(@character.upcase)
end

When(/(\A[0-9\s]{1}) is selected as a symbol\Z/) do |character|
  @character = character
end

When(/^(.{2,}) is selected as a symbol$/) do |character|
  @character = character
end

Then("it cannot be used as a symbol") do
  expect{ @player = Player.new(PlayerType.new(:Human), @character)}.to raise_error(InvalidValueError)
end
