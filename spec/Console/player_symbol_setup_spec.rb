require_relative '../../TicTacToeRuby.Console/Players/player_symbol_setup.rb'
require_relative '../../TicTacToeRuby.Console/Input/console_reader.rb'
require_relative '../../TicTacToeRuby.Console/Output/console_writer.rb'
require_relative '../GamePlay/doubles.rb'

RSpec.configure do |config|
  config.include Doubles
end

RSpec.describe "first player setup" do
  before(:example) do
    @writer = writer_double
  end

  describe "method called get_symbol_for_player" do
    it "returns the expected symbol when a valid symbol is provided" do
      input = "X"
      reader = reader_double(input)
      expect(PlayerSymbolSetup.get_symbol_for_player(@writer, reader)).to eq(input)
    end

    it "returns the symbol in upper case format" do
      input = "y"
      reader = reader_double(input)
      expect(PlayerSymbolSetup.get_symbol_for_player(@writer, reader)).to eq("Y")
    end
  end
end