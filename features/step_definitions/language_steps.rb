require_relative '../../TicTacToeRuby.Console/GamePlay/game_play_setup.rb'
require_relative '../../TicTacToeRuby.Console/Output/console_writer.rb'
require_relative '../../TicTacToeRuby.Console.UnitTests/Input/mock_console_reader.rb'
require 'cucumber/rspec/doubles'

Given("user is at the start screen") do
  @messages = []
  @writer = double(:display_message => @messages << "written")
  @game_play_setup = GamePlaySetup.new(@writer, MockConsoleReader.new("L"), "TicTacToeRuby.Console/Languages/")
end

Then("user is displayed an option to configure the language") do
  @game_play_setup.display_language_config_option
  expect(@messages[0] == "written").to be true
end

Given("default language setting is corrupt") do
  @language_adapter_with_bad_global = LanguageOptionsAdapter.new("../TicTacToeRuby/features/test_files/bad_global_settings/")
  @messages = []
  @writer = double(:display_message => @messages << "written")
  args = { :writer => @writer, :reader => MockConsoleReader.new("L"), :language_config => @language_adapter_with_bad_global }
  @language_setup_with_bad_global = LanguageSetup.new(args)
end

Then("user is displayed an error message indicating the default language setting should be configured manually") do
  @language_setup_with_bad_global.display_language_config_option
  expect(@messages[0] == "written").to be true
end
