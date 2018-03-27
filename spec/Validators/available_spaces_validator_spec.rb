require_relative '../../TicTacToeRuby.Core/Validators/available_spaces_validator.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'

RSpec.describe "an available spaces validator" do
  context "method called get_available_spaces" do
    it "raises an ArgumentError when the board is nil" do
      expect{ AvailableSpacesValidator.get_available_spaces(nil) }.to raise_error(ArgumentError)
    end
  end

  shared_examples "digit?" do |description, value, expected|
    it "returns #{expected} for #{description}" do
      result = AvailableSpacesValidator.digit?(value)
      expect(result).to be expected
    end
  end

  describe "method called digit?" do
    include_examples "digit?", "a single digit", "1", true
    include_examples "digit?", "an alpha character", "A", false
    include_examples "digit?", "a space character", " ", false
    include_examples "digit?", "a dual digit character", "11", true
    include_examples "digit?", "a zero", "0", true
    include_examples "digit?", "a negative number", "-1", false
  end

end