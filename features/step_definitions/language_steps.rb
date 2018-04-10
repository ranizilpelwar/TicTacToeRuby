require_relative '../../TicTacToeRuby.Console/GamePlay/game_play_setup.rb'
require_relative '../../TicTacToeRuby.Console/Output/console_writer.rb'
require_relative '../../TicTacToeRuby.Console.UnitTests/Input/mock_console_reader.rb'
require 'cucumber/rspec/doubles'

Given("user is at the start screen") do
  @messages = []
  @writer = double(:display_message => @messages << "written")
  @game_play_setup = GamePlaySetup.new(@writer, MockConsoleReader.new("L"))
end

Then("user is displayed an option to configure the language") do
  @game_play_setup.display_language_config_option
  expect(@messages[0] == "written").to be true
end