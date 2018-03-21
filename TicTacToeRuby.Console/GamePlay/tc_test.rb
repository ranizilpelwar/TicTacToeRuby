require_relative '../../TicTacToeRuby.Console/Output/console_writer.rb'
require_relative '../../TicTacToeRuby.Console/Input/console_reader.rb'
require_relative '../../TicTacToeRuby.Console.UnitTests/Input/mock_console_reader.rb'
require_relative '../../TicTacToeRuby.Core.UnitTests/Players/mock_player_manager.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Console/GamePlay/game_interaction.rb'
require_relative '../../TicTacToeRuby.Console/GamePlay/game_play_setup.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_movement_manager.rb'
require 'pry'
class TCTest

# writer = ConsoleWriter.new
# reader = ConsoleReader.new
# match_type_manager = MatchTypeManager.new
# #MatchTypeSetup.prompt_for_match_type_selection(writer, match_type_manager)
# MatchTypeSetup.get_valid_match_type(writer, reader, match_type_manager)

  attr_reader :writer, :reader, :game_board, :last_moves_are_recorded, :match_type, :game_play_setup

  def setup
    @writer = ConsoleWriter.new
    @reader = ConsoleReader.new
    board = GameBoard.create_board
    player_manager = MockPlayerManager.new()
    @game_board = GameBoard.new(player_manager, board)
    @match_type = MatchType.new(:Human, :Computer)
    @game_play_setup = GamePlaySetup.new(@writer, @reader)
  end

  def test_the_method
    setup
    # last_moves_are_recorded = false
    # game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
    # game_interaction.play_game
  symbols = @game_play_setup.get_player_symbols
  binding.pry
  player = 5
  end

end

TCTest.new.test_the_method
