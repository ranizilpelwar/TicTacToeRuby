require_relative '../../TicTacToeRuby.Core/GamePlay/computer_actions.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_movement_manager.rb'
require_relative '../../TicTacToeRuby.Core/Validators/tie_game_validator.rb'
require_relative '../../TicTacToeRuby.Core/Validators/game_play_validator.rb'
require_relative '../../TicTacToeRuby.Core/Validators/game_over_validator.rb'
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

  def play_game
    @writer.clear_screen
    show_the_players
    show_the_board
    current_player = @game_board.player_manager.current_player
    prompt_to_continue if current_player.type != "Human" # Allows human player to review updated board from computer player's last move and proceed to play when ready
    continue_playing = true
    while continue_playing
      play_next_turn(current_player)
      continue_playing = !GameOverValidator.game_over?(@game_board.board) && !TieGameValidator.tie_game?(@game_board.board)
      current_player = @game_board.player_manager.update_current_player if continue_playing
    end
    display_game_over_messages
  end

  def play_next_turn(current_player)
    raise ArgumentError, "Cannot play next turn because current_player is nil." if current_player.nil?
    symbol_of_current_player = current_player.symbol
    type_of_current_player = current_player.type
    spot = -10
    tile = ""
    if type_of_current_player == :Human
      prompt_for_next_move
      @writer.display_message("OR type the letter U to undo the last move.") if can_undo_moves?
      spot = get_human_spot(can_undo_moves?)
      if spot == -1 # reflects Undo choice selection
        @player_movement_manager.undo_last_move(@game_board)
        @writer.clear_screen
        show_the_players
        display_undo_last_moves_message
        show_the_board
        prompt_for_next_move
        spot = get_human_spot(false)
      end
    else
      spot = get_computers_spot
      # Give the feel that the computer is thinking of the next move:
      display_thinking_process(symbol_of_current_player)
    end
    
    record_last_move(current_player, spot) if record_last_moves
    tile = @game_board.board[spot]
    @game_board.update_board(spot, symbol_of_current_player)
    @writer.clear_screen
    show_the_players
    display_updated_board_message(symbol_of_current_player, tile)
    show_the_board
  end

  def display_game_over_messages
    @writer.display_message("Game Over!")
    display_game_outcome
    prompt_to_exit
  end

  def prompt_to_exit
    5.times do 
      @writer.display_message("Press the letter E to exit the game. Goodbye!")
      input = @reader.read_input
      break if input.upcase == "E"
    end 
  end

  def display_game_outcome
    if TieGameValidator.tie_game?(@game_board.board)
      @writer.display_message("No winners this time. It's a tie!")
    else
      winning_symbol = @game_board.player_manager.current_player.symbol
      @writer.display_message("Player #{winning_symbol} won! Good game!")
    end
  end

  def prompt_to_continue
    @writer.display_message("Press any key to continue...")
    @reader.read_input  
  end

  def show_the_players
    @writer.display_text("Players: ")
    player1_type = player1.type
    player1_symbol = player1.symbol
    player2_type = player2.type
    player2_symbol = player2.symbol
    @writer.display_text("#{player1_symbol} [ #{player1_type} ], ")
    @writer.display_text("#{player2_symbol} [ #{player2_type} ]\n")
    @writer.display_message("")
  end

  def show_the_board
    @writer.display_message("Tic Tac Toe Board:\n")
    @writer.display_board(@game_board.board)
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
    @writer.display_text("\n")
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
    return spot
  end

  def get_computers_spot
    depth = 5 # The most # of actions that can be taken before a tie or win can occur in the game.
    computer_action = ComputerActions.new(@game_board)
    player_symbol = @game_board.player_manager.current_player.symbol
    spot = computer_action.get_best_move(@game_board.board, player_symbol, depth, BEST_MAX_MOVE, BEST_MIN_MOVE).index
  end
end