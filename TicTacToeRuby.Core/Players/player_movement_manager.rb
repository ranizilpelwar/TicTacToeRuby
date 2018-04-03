class PlayerMovementManager
  
  LARGEST_INDEX = 8

  attr_reader :player1_last_move, :player2_last_move, :match_type

# Type of Match being played determines which player moves are reverted (one or both).
  def initialize(type_of_match)
    raise ArgumentError, MessageGenerator.argument_error("initialize", "type_of_match", "nil") if type_of_match == nil
      @player1_last_move = -1
      @player2_last_move = -1
      @match_type = type_of_match
  end

  def raise_argument_error_for_invalid_player_number(player_number)
    raise ArgumentError, MessageGenerator.argument_error("raise_argument_error_for_invalid_player_number", "player_number", "nil") if player_number.nil?
    raise ArgumentError, MessageGenerator.argument_error("raise_argument_error_for_invalid_player_number", "player_number", "non-existent") if player_number != 1 && player_number != 2
  end

  def raise_argument_error_for_invalid_move(updated_move)
    raise ArgumentError, MessageGenerator.argument_error("raise_argument_error_for_invalid_move", "updated_move", "nil") if updated_move.nil?
    raise ArgumentError, MessageGenerator.argument_error("raise_argument_error_for_invalid_move", "updated_move", "not a valid move on the board") if updated_move < 0 || updated_move > LARGEST_INDEX
  end

  def get_last_move_for_player(player_number)
    raise_argument_error_for_invalid_player_number(player_number)
    last_move = player_number == 1 ? @player1_last_move : @player2_last_move
  end  

  def update_last_move_for_player(player_number, updated_move)
    if player_number == 1
      @player1_last_move = updated_move
    else
      @player2_last_move = updated_move
    end
  end

  def undo_last_move(game_board)
    raise ArgumentError, MessageGenerator.argument_error("undo_last_move", "game_board", "nil") if game_board.nil?
    first_player_type = @match_type.player1_type.selected_option
    second_player_type = @match_type.player2_type.selected_option
    if (first_player_type == :Human && second_player_type == :Computer) || (first_player_type == :Computer && second_player_type == :Human)
      game_board.revert_board(get_last_move_for_player(1))
      game_board.revert_board(get_last_move_for_player(2))
    elsif first_player_type == :Human && second_player_type == :Human
      player_manager = game_board.player_manager
      player_number = player_manager.get_player_number(player_manager.current_player)
      game_board.revert_board(get_last_move_for_player(player_number))
    else
      raise ArgumentError, MessageGenerator.argument_error("undo_last_move", "match_type", "invalid")
    end
  end
end
