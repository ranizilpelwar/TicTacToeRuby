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
end
