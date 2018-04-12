require_relative '../../TicTacToeRuby.Console/Languages/language_options_adapter.rb'

RSpec.describe "a language options adapter" do
  context "method called input_choices" do
    it "raises an ArgumentError when options is nil" do
      expect{ LanguageOptionsAdapter.new("TicTacToeRuby.Console/Languages/").input_choices(nil) }.to raise_error(ArgumentError)
    end

    it "returns the expected list of input choices" do
      expected_choices = ["1", "2"]
      expect(LanguageOptionsAdapter.new("TicTacToeRuby.Console/Languages/").input_choices).to eq(expected_choices)
    end
  end

  context "method called get_language_tags" do
    it "returns the expected number of language tags" do
      expect(LanguageOptionsAdapter.new("TicTacToeRuby.Console/Languages/").language_tags.size).to eq(2)
    end
  end
end