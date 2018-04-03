require_relative '../../TicTacToeRuby.Console/Languages/language_setup.rb'

RSpec.describe "a language setup" do
  context "method called get_input_choices" do
    it "raises an ArgumentError when options is nil" do
      expect{ LanguageSetup.get_input_choices(nil) }.to raise_error(ArgumentError)
    end

    it "returns the expected list of input choices" do
      expected_choices = ["1", "2"]
      expect(LanguageSetup.get_input_choices).to eq(expected_choices)
    end
  end

  context "method called get_available_language_tags" do
    it "returns the expected number of language tags" do
      expect(LanguageSetup.get_language_tags.size).to eq(2)
      #loc = LanguageSetup.get_localization
      #expect(loc).to eq("en")
    end
  end
end