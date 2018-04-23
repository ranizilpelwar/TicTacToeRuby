require_relative '../../TicTacToeRuby.Console/GamePlay/game_play_setup.rb'
require_relative '../../TicTacToeRuby.Console/Output/console_writer.rb'
require_relative '../../TicTacToeRuby.Console.UnitTests/Input/mock_console_reader.rb'
require 'cucumber/rspec/doubles'
require 'pp'
require 'fakefs/spec_helpers'

Given("user is at the start screen") do
  @messages = []
  @writer = double(:display_message => @messages << "written")
  @game_play_setup = GamePlaySetup.new(@writer, MockConsoleReader.new("L"), "TicTacToeRuby.Console/Languages/")
end

Then("user is displayed an option to configure the language") do
  @game_play_setup.display_language_config_option
  expect(@messages[0] == "written").to be true
end

Given("default language setting is stored as an invalid value") do
  allow(YAMLReader).to receive(:read_data).and_return("ex")
  real_file_sandbox = '../test_files/bad_global_settings/test/'
  @language_adapter_with_bad_global = LanguageOptionsAdapter.new(real_file_sandbox)
  @messages = []
  @writer = double(:display_message => @messages << "written")
  args = { :writer => @writer, :reader => MockConsoleReader.new("L"), :language_config => @language_adapter_with_bad_global }
  @language_setup_with_bad_global = LanguageSetup.new(args)
end

Then("user is displayed a language configuration error message") do
  @language_setup_with_bad_global.display_language_config_error
  expect(@messages[0] == "written").to be true
end
