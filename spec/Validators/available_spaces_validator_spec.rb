require_relative '../../TicTacToeRuby.Core/Validators/available_spaces_validator.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'

RSpec.describe "an available spaces validator" do
  context "method called get_available_spaces" do
    it "raises an ArgumentError when the board is nil" do
      expect{ AvailableSpacesValidator.get_available_spaces(nil) }.to raise_error(ArgumentError)
    end
  end

  context "method called digit?" do
    it "returns false for an alpha character" do
      value = "A"
      result = AvailableSpacesValidator.digit?(value)
      expect(result).to be false
    end

    it "returns false for a space character" do
      value = " "
      result = AvailableSpacesValidator.digit?(value)
      expect(result).to be false
    end

    it "returns true for a single digit" do
      value = " "
      result = AvailableSpacesValidator.digit?(value)
      expect(result).to be false
    end
  end
end