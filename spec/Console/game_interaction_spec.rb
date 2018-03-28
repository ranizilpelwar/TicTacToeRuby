require_relative '../../TicTacToeRuby.Console/Output/console_writer.rb'
require_relative '../../TicTacToeRuby.Console.UnitTests/Input/mock_console_reader.rb'
require_relative '../../TicTacToeRuby.Core.UnitTests/Players/mock_player_manager.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Console/GamePlay/game_interaction.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_movement_manager.rb'
require_relative '../GamePlay/doubles.rb'

RSpec.configure do |config|
  config.include Doubles
end

RSpec.describe "a game interaction" do
  before(:example) do
    @writer = writer_double
    @reader = reader_double
    board = GameBoard.create_board
    player_manager = player_manager_double
    @game_board = GameBoard.new(player_manager, board)
    @match_type = MatchType.new(:Computer, :Human)
  end

  context "initialization" do
    it "raises ArgumentError when writer is nil" do
      expect{ GameInteraction.new(nil, @reader, @game_board, false, @match_type) }.to raise_error(ArgumentError)
    end

    it "raises ArgumentError when reader is nil" do
      expect{ GameInteraction.new(@writer, nil, @game_board, false, @match_type) }.to raise_error(ArgumentError)
    end

    it "raises ArgumentError when game board is nil" do
      expect{ GameInteraction.new(@writer, @reader, nil, false, @match_type) }.to raise_error(ArgumentError)
    end

    it "raises ArgumentError when match type is nil" do
      expect{ GameInteraction.new(@writer, @reader, @game_board, false, nil) }.to raise_error(ArgumentError)
    end

    it "has a nil PlayerMovementManager when last moves is false" do
      game_interaction = GameInteraction.new(@writer, @reader, @game_board, false, @match_type)
      expect(game_interaction.player_movement_manager.nil?).to be true
    end

    it "has a non-nil PlayerMovementManager when last moves is true" do
      game_interaction = GameInteraction.new(@writer, @reader, @game_board, true, @match_type)
      expect(game_interaction.player_movement_manager.nil?).to be false
    end
  end

  describe "get_computers_spot" do
    it "returns a valid index on the game board" do
      last_moves_are_recorded = false
      game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
      spot = game_interaction.get_computers_spot
      expect(spot).to be >=0
      expect(spot).to be < @game_board.board.length
    end
  end

  describe "method called record_last_move" do
    it "stores the correct move for a given player" do
      last_moves_are_recorded = true
      game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
      player = @game_board.player_manager.player1
      expected_player1_last_move = 4
      game_interaction.record_last_move(player, expected_player1_last_move)
      actual_player1_last_move = game_interaction.player_movement_manager.player1_last_move
      expect(actual_player1_last_move).to eq(expected_player1_last_move)
    end 
  end

  describe "method called can_undo_moves?" do
    it "returns false when game is first started" do
      last_moves_are_recorded = true
      game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
      expect(game_interaction.can_undo_moves?).to be false
    end

    it "returns false when only one player makes a move" do
      last_moves_are_recorded = true
      game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
      player = @game_board.player_manager.player1
      player1_last_move = 4
      game_interaction.record_last_move(player, player1_last_move)
      expect(game_interaction.can_undo_moves?).to be false
    end

    it "returns true when both players have made a move" do
      last_moves_are_recorded = true
      game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
      player = @game_board.player_manager.player1
      player1_last_move = 4
      game_interaction.record_last_move(player, player1_last_move)
      player = @game_board.player_manager.player2
      player2_last_move = 5
      game_interaction.record_last_move(player, player2_last_move)
      expect(game_interaction.can_undo_moves?).to be true
    end
  end

  describe "method called play_next_turn" do
    it "raises an ArgumentError when current player is nil" do
      last_moves_are_recorded = false
      game_interaction = GameInteraction.new(@writer, @reader, @game_board, last_moves_are_recorded, @match_type)
      expect{ game_interaction.play_next_turn(nil) }.to raise_error(ArgumentError)
    end
  end
end

         