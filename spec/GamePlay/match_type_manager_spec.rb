require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'

RSpec.describe "a match type manager" do
  context "intialization" do
    it "creates a total of three match types" do
      expected_length = 3
      match_type_manager = MatchTypeManager.new
      actual_length = match_type_manager.matches.length
      expect(actual_length).to eq(expected_length)
    end
  end

  context "method called get_total_available_matches" do
    it "returns a value of three" do
      expected_total = 3
      match_type_manager = MatchTypeManager.new
      actual_total = match_type_manager.get_total_available_matches
      expect(actual_total).to eq(expected_total)
    end
  end

  context "method called get_match_type" do
    it "raises an ArgumentError when the match number is zero" do
      match_type_manager = MatchTypeManager.new
      expect{ match_type_manager.get_match_type(0) }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when the match number is four" do
      match_type_manager = MatchTypeManager.new
      expect{ match_type_manager.get_match_type(4) }.to raise_error(ArgumentError)
    end

    it "returns a Human vs Human match type when match number is set to one" do
      expected_player1_type = :Human
      match_type_manager = MatchTypeManager.new
      actual_match_type = match_type_manager.get_match_type(1)
      actual_player1_type = actual_match_type.player1_type.selected_option
      expect(actual_player1_type).to eq(expected_player1_type)
    end
  end

  context "method called valid?" do
    it "returns false when match number is four" do
      match_type_manager = MatchTypeManager.new
      expect(match_type_manager.valid?(4)).to be false
    end

    it "returns false when match number is zero" do
      match_type_manager = MatchTypeManager.new
      expect(match_type_manager.valid?(0)).to be false
    end

    it "returns true when match number is one" do
      match_type_manager = MatchTypeManager.new
      expect(match_type_manager.valid?(1)).to be true
    end
  end
end