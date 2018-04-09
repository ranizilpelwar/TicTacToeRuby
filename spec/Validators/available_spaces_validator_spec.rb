require_relative '../../TicTacToeRuby.Core/Validators/available_spaces_validator.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'

RSpec.describe "an available spaces validator" do
  context "method called get_available_spaces" do
    it "raises a NilReferenceError when the board is nil" do
      expect{ AvailableSpacesValidator.get_available_spaces(nil) }.to raise_error(NilReferenceError)
    end

    it "returns one element when there is only one available spot on the board" do
      board = ["X", "X", "X", "X", "X", "X", "X", "X", "9"]
      expected_result = 1
      available_spaces = AvailableSpacesValidator.get_available_spaces(board)
      actual_result = available_spaces.length
      expect(actual_result).to eq(expected_result)
    end

    it "returns zero elements when there are no available spots on the board" do
      board = ["X", "X", "X", "X", "X", "X", "X", "X", "X"]
      expected_result = 0
      available_spaces = AvailableSpacesValidator.get_available_spaces(board)
      actual_result = available_spaces.length
      expect(actual_result).to eq(expected_result)
    end

    it "returns nine elements when they are all available spots on the board" do
      board = GameBoard.create_board
      expected_result = 9
      available_spaces = AvailableSpacesValidator.get_available_spaces(board)
      actual_result = available_spaces.length
      expect(actual_result).to eq(expected_result)
    end

    it "contains expected index when there is only one available spot on the board" do
      board = ["X", "X", "X", "X", "X", "X", "X", "X", "9"]
      expected_result = 8
      available_spaces = AvailableSpacesValidator.get_available_spaces(board)
      actual_result = available_spaces[0]
      expect(actual_result).to eq(expected_result)
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