require_relative '../../TicTacToeRuby.Core/GamePlay/computer_actions.rb'

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
    raise ArgumentError, "Cannot create new GameInteraction because match_type is nil." if match_type.nil?
    @writer = writer
    @reader = reader
    @game_board = game_board
    player_manager = game_board.player_manager
    @player1 = player_manager.player1
    @player2 = player_manager.player2
    @record_last_moves = last_moves_are_recorded
    @player_movement_manager = PlayerMovementManager.new(match_type) if @record_last_moves
  end

  # Evaluates whether the game play allows for undoing a move. False is returned if there are no moves to undo. This happens when the game first
  # starts and no one has made a move yet.
  # This happens in pairs - when both players have a move to undo.
  def can_undo_moves?
    can_undo = 
      if record_last_moves
        last_move_for_player1 = @player_movement_manager.get_last_move_for_player(1)
        last_move_for_player2 = @player_movement_manager.get_last_move_for_player(2)
        last_move_for_player1 != -1 && last_move_for_player2 != -1
      else
        false
      end
  end

  def record_last_move(player, spot)
    player_number = @game_board.player_manager.get_player_number(player)
    @player_movement_manager.update_last_move_for_player(player_number, spot)
  end

  def display_updated_board_message(symbol_of_current_player, spot)
    @writer.display_message("Player #{symbol_of_current_player} picked spot #{spot}!\n")
  end

  def display_undo_last_moves_message
    @writer.display_text("Undo complete")
    @writer.display_text(" for both players") if @player1.type == "Computer" || @player2.type == "Computer"
    @writer.display_text("!\n\n")
  end

  def display_thinking_process(symbol_of_current_player)
    raise ArgumentError, "Cannot display_thinking_process because symbol_of_current_player is empty." if symbol_of_current_player == ""
    message = "Player #{symbol_of_current_player}'s Turn: Player is thinking of next move"
    @writer.display_text(message)
    5.times do
      @writer.display_text(".")
      sleep(1) # seconds
    end
  end

  def prompt_for_next_move
    player_symbol = @game_board.player_manager.current_player.symbol
    @writer.display_message("Player #{player_symbol}'s Turn: Where do you want to move?")
    @writer.display_message("Type a number that you see on the board.")
  end

  # allow_undo: True if the user can type in the letter U to undo the last move, or False otherwise.
  # Returns: A valid spot on the board chosen by the player, OR returns -1 if the player chose to undo the last move.
  def get_human_spot(allow_undo)
    input = ""
    valid_move = false
    expected_input_to_undo_move = "U"
    while(!valid_move)
      @writer.display_message("Oops! I couldn't use that. Please try another key.") if input != ""
      input = @reader.read_input_ignore_empty
      if allow_undo && input.upcase == expected_input_to_undo_move.upcase
          valid_move = true
          spot = -1
      else
        return_result = GamePlayValidator.evaluate_move(@game_board, input)
        valid_move = return_result.is_valid_move
        spot = return_result.index_of_board
      end
    end
  end

  def get_computers_spot
    depth = 5 # The most # of actions that can be taken before a tie or win can occur in the game.
    computer_action = ComputerActions.new(@game_board)
    player_symbol = @game_board.player_manager.current_player.symbol
    spot = computer_action.get_best_move(@game_board.board, player_symbol, depth, BEST_MAX_MOVE, BEST_MIN_MOVE).index
  end
end