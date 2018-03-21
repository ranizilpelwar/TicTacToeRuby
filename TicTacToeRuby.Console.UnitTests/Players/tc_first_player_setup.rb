require 'test/unit'
require_relative '../../TicTacToeRuby.Console/Players/first_player_setup.rb'
require_relative '../../TicTacToeRuby.Console/Output/console_writer.rb'
require_relative '../Input/mock_console_reader.rb'

class TestFirstPlayerSetup < Test::Unit::TestCase
  
  attr_reader :reader, :writer

  def setup_reader_and_writer(input)
    @writer = ConsoleWriter.new
    @reader = MockConsoleReader.new(input)
  end

  def test_prompt_for_first_player_symbol_returns_expected_symbol_when_valid_symbol_is_provided
    input = "X"
    setup_reader_and_writer(input)
    assert_equal(input, FirstPlayerSetup.prompt_for_first_player_symbol(@writer, @reader, "X", "Y"), 
      "Symbol read in should be returned as it it valid.")
  end

  def test_prompt_for_first_player_symbol_returns_symbol_in_upper_case_format
    input = "y"
    setup_reader_and_writer(input)
    assert_equal("Y", FirstPlayerSetup.prompt_for_first_player_symbol(@writer, @reader, "x", "y"), 
      "Symbol read in should be returned in upper case format as it it valid.")
  end
end

