require_relative '../../TicTacToeRuby.Core/Validators/player_symbol_validator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

RSpec.describe "a player symbol validator" do
  shared_examples "valid symbol" do |description, input, expected|
    it "returns #{expected} for #{description}" do
      expect(PlayerSymbolValidator.valid?(input)).to be expected
    end
  end

  context "method called valid?" do
    include_examples "valid symbol", "a single digit", "1", false
    include_examples "valid symbol", "a dual digit", "11", false
    include_examples "valid symbol", "an input with length greater than 1", "XX", false
    include_examples "valid symbol", "an upper case alpha character", "A", true
    include_examples "valid symbol", "a lower case alpha character", "a", true
    include_examples "valid symbol", "a percent character", "%", true
    include_examples "valid symbol", "a pound character", "#", true
    include_examples "valid symbol", "a space character", " ", false
  
    it "raises a NilReferenceError when input is nil" do
      expect{ PlayerSymbolValidator.valid?(nil) }.to raise_error(NilReferenceError)
    end

    it "raises an InvalidValueError when input is an empty string" do
      expect{ PlayerSymbolValidator.valid?("") }.to raise_error(InvalidValueError)
    end
  end
end