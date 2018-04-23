require_relative '../../TicTacToeRuby.Console/GamePlay/game_play_setup.rb'
require_relative '../../TicTacToeRuby.Console/Output/console_writer.rb'
require_relative '../../TicTacToeRuby.Console.UnitTests/Input/mock_console_reader.rb'
require 'cucumber/rspec/doubles'
require 'pp'
require 'fakefs/spec_helpers'

Given("user is at the start screen") do
  @messages = []
  @writer = double(:display_message => @messages << "written", :display_text => @messages << "written")
  @reader = double()
  args = {:writer => @writer, :reader => @reader, :language_config => double()}
  @language_setup = LanguageSetup.new(args)
end

Then("user is displayed an option to configure the language") do
  @language_setup.display_options
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
  @language_setup_with_bad_global.error_message
  expect(@messages[0] == "written").to be true
end

When("the user types the letter L") do
  allow(@reader).to receive(:read_and_validate).and_return("L")
end

Then("the system identifies that the user requested the language to be configured") do
  inquiry = @language_setup.language_configuration_requested?([])
  expect(inquiry.feedback).to be true
end
