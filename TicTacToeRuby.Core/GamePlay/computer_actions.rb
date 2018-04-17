require_relative 'game_board.rb'
require_relative 'weighted_move.rb'
require_relative '../Players/player_manager.rb'
require_relative '../Validators/available_spaces_validator.rb'
require_relative '../Validators/game_over_validator.rb'
require_relative '../Validators/player_symbol_validator.rb'
require_relative '../Evaluators/board_score_evaluator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

class ComputerActions
  attr_reader :current_player, :other_player, :game_board

  def initialize(game_board, player_manager)
    raise NilReferenceError, "game_board" if game_board.nil?
    raise NilReferenceError, "player_manager" if player_manager.nil?
    @game_board = game_board
    @current_player = player_manager.current_player.symbol
    @other_player = player_manager.get_next_player.symbol
  end

  def reset_board_tile(board, move, tile)
    board[move] = tile
  end

  def get_best_move(board, player_symbol, depth, best_max_value, best_min_value)
    raise NilReferenceError, "board" if board.nil?
    raise InvalidValueError, "player_symbol" if !PlayerSymbolValidator.valid?(player_symbol)
    next_moves = AvailableSpacesValidator.get_available_spaces(board)
    tile = ""
    current_score = 0
    best_move = -1

    current = player_symbol == current_player
    if current 
        opposing_symbol = other_player
    else
        opposing_symbol = current_player
    end

    win_exists = GameOverValidator.win_for_player?(player_symbol, board) || GameOverValidator.win_for_player?(opposing_symbol, board)
    
    if next_moves.size == 0 || depth == 0 || win_exists
      current_score = BoardScoreEvaluator.score_of_board(board, current_player, other_player) * (depth + 1)
      move = WeightedMove.new(best_move, current_score)
      return move
    end

    next_moves.each do |move|
      tile = board[move]
      board[move] = player_symbol
	    current_score = get_best_move(board, opposing_symbol, depth - 1, best_max_value, best_min_value).score
      if current
        if current_score > best_max_value
          best_max_value = current_score
          best_move = move
    	  end
      else
        if current_score < best_min_value
          best_min_value = current_score
          best_move = move
        end
    	end

      reset_board_tile(board, move, tile)
      found_best_route = best_max_value >= best_min_value

  	  break if found_best_route
    end
    if current
      score = best_max_value
    else
      score = best_min_value
    end

    weighted_move = WeightedMove.new(best_move, score)
    return weighted_move
  end
end

