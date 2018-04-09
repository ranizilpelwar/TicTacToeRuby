require_relative '../../TicTacToeRuby.Core/Validators/player_selection_validator.rb'

RSpec.describe "a player selection validator" do
  shared_examples "match symbol entries" do |description, input, player_symbol_one, player_symbol_two, expected|
    it "returns #{expected} for #{description}" do
      return_value = PlayerSelectionValidator.valid?(input, player_symbol_one, player_symbol_two)
      expect(return_value).to be expected
    end
  end

  context "method called valid?" do
    include_examples "match symbol entries", "a space character", " ", "A", "B", false
    include_examples "match symbol entries", "a digit", "1", "A", "B", false
    include_examples "match symbol entries", "a lowercase value for player 1", "a", "A", "B", true
    include_examples "match symbol entries", "a lowercase value for player 2", "b", "A", "B", true
  
    it "raises a NilReferenceError when input is nil" do
      expect{ PlayerSelectionValidator.valid?(nil, "X", "Y") }.to raise_error(NilReferenceError)
    end

    it "raises a NilReferenceError when player_symbol_one is nil" do
      expect{ PlayerSelectionValidator.valid?("input", nil, "X") }.to raise_error(NilReferenceError)
    end

    it "raises a NilReferenceError when player_symbol_two is nil" do
      expect{ PlayerSelectionValidator.valid?("input", "X", nil) }.to raise_error(NilReferenceError)
    end

    it "raises a InvalidValueError when input is an empty string" do
      expect{ PlayerSelectionValidator.valid?("", "X", "Y") }.to raise_error(InvalidValueError)
    end

    it "raises a InvalidValueError when player_symbol_one is an empty string" do
      expect{ PlayerSelectionValidator.valid?("input", "", "X") }.to raise_error(InvalidValueError)
    end

    it "raises an InvalidValueError when player_symbol_two is an empty string" do
      expect{ PlayerSelectionValidator.valid?("input", "X", "") }.to raise_error(InvalidValueError)
    end
  end
end