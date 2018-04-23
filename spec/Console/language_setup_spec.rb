require_relative '../../TicTacToeRuby.Core/Languages/language_options_adapter.rb'

RSpec.describe "a language setup" do
  context "method called input_choices" do
    it "returns the expected list of input choices" do
      expected_choices = ["L", "l"]
      args = {writer: double(), 
            reader: double(), 
            language_config: double(:valid => true)}
      @language_setup = LanguageSetup.new(args)
      expect(@language_setup.input_choices).to eq(expected_choices)
    end
  end
end