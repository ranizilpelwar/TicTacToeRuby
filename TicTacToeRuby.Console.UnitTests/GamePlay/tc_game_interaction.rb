require 'test/unit'
require_relative '../../TicTacToeRuby.Console/Output/console_writer.rb'
require_relative '../../TicTacToeRuby.Console.UnitTests/Input/mock_console_reader.rb'
require_relative '../../TicTacToeRuby.Core.UnitTests/Players/mock_player_manager.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Console/GamePlay/game_interaction.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_movement_manager.rb'

class TestGameInteraction < Test::Unit::TestCase
  
   attr_reader :writer, :reader, :game_board, :last_moves_are_recorded, :match_type

  def setup
    @writer = ConsoleWriter.new
    @reader = MockConsoleReader.new("X")
    board = GameBoard.create_board
    player_manager = MockPlayerManager.new()
    @game_board = GameBoard.new(player_manager, board)
    @match_type = MatchType.new(:Human, :Computer)
  end

  def test_raise_argument_error_when_writer_is_nil
    assert_raises(ArgumentError) do 
      last_moves_are_recorded = false
      GameInteraction.new(nil, @reader, @game_board, last_moves_are_recorded, @match_type)
    end
  end

  def test_raise_argument_error_when_reader_is_nil
    assert_raises(ArgumentError) do 
      last_moves_are_recorded = false
      GameInteraction.new(@writer, nil, @game_board, last_moves_are_recorded, @match_type)
    end
  end

  def test_raise_argument_error_when_game_board_is_nil
    assert_raises(ArgumentError) do 
      last_moves_are_recorded = false
      GameInteraction.new(@writer, @reader, nil, last_moves_are_recorded, @match_type)
    end
  end

  def test_raise_argument_error_when_match_type_is_nil
    assert_raises(ArgumentError) do 
      last_moves_are_recorded = false
      GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, nil)
    end
  end

  def test_player_manager_should_be_nil_when_last_moves_are_recorded_property_is_false
    last_moves_are_recorded = false
    game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
    assert_equal(nil, game_interaction.player_movement_manager, "Expecting player_movement_manager to be nil because last_moves_are_recorded is false.")
  end
end




