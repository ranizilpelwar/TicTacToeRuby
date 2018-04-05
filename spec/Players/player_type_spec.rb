require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

RSpec.describe "a player type" do
  context "initialization" do
    it "raises a PlayerTypeError when created as a robot" do
      expect{PlayerType.new(:Robot)}.to raise_error(InvalidValueError)
    end
  end

  context "method called valid?" do
    it "returns true when a Human is entered as a parameter" do
      expect(PlayerType.valid?(:Human)).to be true
    end

    it "returns true when a Computer is entered as a parameter" do
      expect(PlayerType.valid?(:Computer)).to be true
    end

    it "returns false when a Robot is entered as a parameter" do
      expect(PlayerType.valid?(:Robot)).to be false
    end
  end
end