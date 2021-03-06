require_relative '../../TicTacToeRuby.Core/Languages/message_generator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

class PlayerMovementManager
  
  LARGEST_INDEX = 8

  attr_reader :player1_last_move, :player2_last_move, :match_type

  def no_last_move
    -1
  end

# Type of Match being played determines which player moves are reverted (one or both).
  def initialize(type_of_match)
    raise NilReferenceError, "type_of_match" if type_of_match == nil
      @player1_last_move = no_last_move
      @player2_last_move = no_last_move
      @match_type = type_of_match
  end

  def raise_error_for_invalid_player_number(player_number)
    raise NilReferenceError, "player_number" if player_number.nil?
    raise InvalidValueError, "player_number" if player_number != 1 && player_number != 2
  end

  def get_last_move_for_player(player_number)
    raise_error_for_invalid_player_number(player_number)
    last_move = player_number == 1 ? @player1_last_move : @player2_last_move
  end  

  def update_last_move_for_player(player_number, updated_move)
    if player_number == 1
      @player1_last_move = updated_move
    else
      @player2_last_move = updated_move
    end
  end

  def undo_last_move(game_board, player_manager)
    raise NilReferenceError, "game_board" if game_board.nil?
    raise NilReferenceError, "player_manager" if player_manager.nil?
    first_player_type = @match_type.player1_type.selected_option
    second_player_type = @match_type.player2_type.selected_option
    raise GameRuleViolationError, MessageGenerator.no_moves_to_undo_error if !any_moves_to_undo? || number_of_human_players == 0
    if number_of_human_players == 1
      game_board.revert_board(get_last_move_for_player(1))
      game_board.revert_board(get_last_move_for_player(2))
      @player1_last_move = no_last_move
      @player2_last_move = no_last_move
    elsif number_of_human_players == 2
      player_number = player_manager.get_player_number(player_manager.current_player)
      game_board.revert_board(get_last_move_for_player(player_number))
      if player_number == 1
        @player1_last_move = no_last_move
      else
        @player2_last_move = no_last_move
      end
    end
  end

  def moves_recordable?(match_number)
    match_manager = MatchTypeManager.new
    match_manager.player_type(match_number, 1) == "Human" || match_manager.player_type(match_number, 2) == "Human"
  end

  def any_moves_to_undo?
    get_last_move_for_player(1) != -1 && get_last_move_for_player(2) != -1
  end

  def number_of_human_players
    first_player_type = @match_type.player1_type.selected_option
    second_player_type = @match_type.player2_type.selected_option
    count = 0
    count = count + 1 if first_player_type == :Human
    count = count + 1 if second_player_type == :Human
    count
  end
end