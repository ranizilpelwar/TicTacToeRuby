require 'test/unit'
require_relative '../../TicTacToeRuby.Console/Players/player_symbol_setup.rb'
require_relative '../../TicTacToeRuby.Console/Input/console_reader.rb'
require_relative '../../TicTacToeRuby.Console/Output/console_writer.rb'
require_relative '../Input/mock_console_reader.rb'

class TestPlayerSymbolSetup < Test::Unit::TestCase
  
  attr_reader :reader, :writer

  def setup_reader_and_writer(input)
    @writer = ConsoleWriter.new
    @reader = MockConsoleReader.new(input)
  end

  def test_get_symbol_for_player_returns_expected_symbol_when_valid_symbol_is_provided
    input = "X"
    setup_reader_and_writer(input)
    assert_equal(input, PlayerSymbolSetup.get_symbol_for_player(@writer, @reader), 'Symbol read in should be returned as it it valid.')
  end

  def test_get_symbol_for_player_returns_symbol_in_upper_case_format
    input = "y"
    setup_reader_and_writer(input)
    assert_equal("Y", PlayerSymbolSetup.get_symbol_for_player(@writer, @reader), 'Symbol read in should be returned in upper case as it it valid.')
  end
end

