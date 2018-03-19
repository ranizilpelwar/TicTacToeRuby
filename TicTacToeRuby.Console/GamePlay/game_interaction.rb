class GameInteraction

  # Used to pass in the constraints for the GetComputerSpot method. Represents the Alpha in the Alpha-Beta 
  # pruning process of the minimax algorithm.
  BEST_MAX_MOVE = -20000

  # Used to pass in the constraints for the GetComputerSpot method. Represents the Beta in the Alpha-Beta 
  # pruning process of the minimax algorithm.
  BEST_MIN_MOVE = 20000

  attr_reader :game_board, :writer, :reader, :player1, :player2, :player_movement_manager, :record_last_moves

  def initialize(writer, reader, game_board, last_moves_are_recorded, match_type)
    raise ArgumentError, "Cannot create new GameInteraction because writer is nil." if writer.nil?
    raise ArgumentError, "Cannot create new GameInteraction because reader is nil." if reader.nil?
    raise ArgumentError, "Cannot create new GameInteraction because game_board is nil." if game_board.nil?
    @writer = writer
    @reader = reader
    @game_board = game_board
    player_manager = game_board.player_manager
    @player1 = player_manager.player1
    @player2 = player_manager.player2
    @record_last_moves = last_moves_are_recorded
    player_movement_manager = PlayerMovementManager.new(match_type) if @record_last_moves
  end
end