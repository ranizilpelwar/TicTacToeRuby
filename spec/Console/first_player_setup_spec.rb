require_relative '../../TicTacToeRuby.Console/Players/first_player_setup.rb'
require_relative '../../TicTacToeRuby.Console/Output/console_writer.rb'
require_relative '../GamePlay/doubles.rb'

RSpec.configure do |config|
  config.include Doubles
end

RSpec.describe "first player setup" do
  before(:example) do
    @writer = writer_double
  end

  describe "method called prompt_for_first_player_symbol" do
    it "returns expected symbol when valid symbol is provided" do
      input = "X"
      reader = reader_double(input)
      expect(FirstPlayerSetup.prompt_for_first_player_symbol(@writer, reader, "X", "Y")).to eq(input)
    end

    it "returns symbol in upper case format" do
      reader = reader_double("x")
      expect(FirstPlayerSetup.prompt_for_first_player_symbol(@writer, reader, "x", "y")).to eq("X")
    end
  end
end