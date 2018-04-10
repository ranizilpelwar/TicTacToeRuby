require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'

When(/match option ([1-3]{1}) is selected/) do |number|
  @match_type_manager = MatchTypeManager.new
  @match_type = @match_type_manager.get_match_type(number.to_i)
  @player1 = Player.new(@player_type, "X")
  expect(@player_type.selected_option).to eq(@match_type.player1_type.selected_option)
end

Then(/the second player is a (Human|Computer)/) do |type2|
  @player_type2_expected = type2.to_sym
  @player_type2_actual = @match_type.player2_type.selected_option
  expect(@player_type2_actual).to eq(@player_type2_expected)
end

Then("there are three total matches available to select from") do
  match_manager = MatchTypeManager.new
  expect(match_manager.get_total_available_matches).to eq(3)
end