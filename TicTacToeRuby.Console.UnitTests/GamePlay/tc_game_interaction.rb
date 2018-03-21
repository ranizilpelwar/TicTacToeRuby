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
    @match_type = MatchType.new(:Computer, :Human)
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

  def test_player_manager_should_be_nil_when_last_moves_property_is_false
    last_moves_are_recorded = false
    game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
    assert(game_interaction.player_movement_manager.nil?, "Expecting player_movement_manager to be nil because last_moves_are_recorded is false.")
  end

  def test_player_manager_should_not_be_nil_when_last_moves_property_is_true
    last_moves_are_recorded = true
    game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
    assert(!game_interaction.player_movement_manager.nil?, "Expecting player_movement_manager to not be nil because last_moves_are_recorded is true.")
  end

  def test_get_computers_spot_returns_an_index_on_the_game_board
    last_moves_are_recorded = false
    game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
    spot = game_interaction.get_computers_spot
    assert(spot >= 0 && spot < @game_board.board.length, "Expected spot to be an index on the game board.")
  end

  def test_record_last_move_stores_correct_move_for_player
    last_moves_are_recorded = true
    game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
    player = @game_board.player_manager.player1
    expected_player1_last_move = 4
    game_interaction.record_last_move(player, expected_player1_last_move)
    actual_player1_last_move = game_interaction.player_movement_manager.player1_last_move
    assert_equal(expected_player1_last_move, actual_player1_last_move, "Expected that the stored value would match what was passed in.")
  end

  def test_there_are_no_moves_to_undo_when_game_is_first_started
    last_moves_are_recorded = true
    game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
    assert(!game_interaction.can_undo_moves?)
  end

  def test_there_are_no_moves_to_undo_when_only_one_player_makes_a_move
    last_moves_are_recorded = true
    game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
    player = @game_board.player_manager.player1
    player1_last_move = 4
    game_interaction.record_last_move(player, player1_last_move)
    assert(!game_interaction.can_undo_moves?)
  end

  def test_there_are_moves_to_undo_when_both_players_have_made_a_move
    last_moves_are_recorded = true
    game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
    player = @game_board.player_manager.player1
    player1_last_move = 4
    game_interaction.record_last_move(player, player1_last_move)
    player = @game_board.player_manager.player2
    player2_last_move = 5
    game_interaction.record_last_move(player, player2_last_move)
    assert(game_interaction.can_undo_moves?)
  end

  def test_play_next_turn_raises_argument_error_when_current_player_is_nil
    last_moves_are_recorded = false
    game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
    assert_raises(ArgumentError) do
      game_interaction.play_next_turn(nil)
    end
  end
end




