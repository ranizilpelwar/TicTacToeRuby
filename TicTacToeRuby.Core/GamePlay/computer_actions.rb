require_relative 'game_board.rb'
require_relative 'weighted_move.rb'
require_relative '../Players/player_manager.rb'
require_relative '../Validators/available_spaces_validator.rb'
require_relative '../Validators/board_score_validator.rb'
require_relative '../Validators/game_over_validator.rb'
require_relative '../Validators/player_symbol_validator.rb'

class ComputerActions
  attr_reader :current_player, :other_player, :game_board

  def initialize(game_board)
    raise ArgumentError, "Cannot create ComputerActions with nil game_board." if game_board.nil?
    @game_board = game_board
    @player_manager = @game_board.player_manager
    @current_player = @player_manager.current_player.symbol
    @other_player = @player_manager.get_next_player.symbol
  end

  def get_best_move(board, player_symbol, depth, best_max_value, best_min_value)
    raise ArgumentError, "Cannot get best move because board is nil." if board.nil?
    raise ArgumentError, "Cannot get best move because player_symbol is invalid." if !PlayerSymbolValidator.valid?(player_symbol)
    next_moves = AvailableSpacesValidator.get_available_spaces(board)
    tile = ""
    current_score = 0
    best_move = -1
    if next_moves.size == 0 || depth == 0
      current_score = BoardScoreValidator.evaluate_score_of_board(board, current_player, other_player)
      move = WeightedMove.new(best_move, current_score)
      return move
    else
      next_moves.each do |move|
	      tile = board[move]
        board[move] = player_symbol
        win_exists = GameOverValidator.win_for_player?(player_symbol, board)
        if player_symbol == current_player 
          opposing_symbol = other_player
        else
          opposing_symbol = current_player
        end
    	  if win_exists
          # An early win or block has an advantage:
    	    current_score = BoardScoreValidator.evaluate_score_of_board(board, current_player, other_player) * depth
    	  else
    	    current_score = get_best_move(board, opposing_symbol, depth - 1, best_max_value, best_min_value).score
        end
        if player_symbol == current_player
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
    	  #Reset the board tile:
        board[move] = tile
    	  #Stop traversing more nodes in this branch:
    	  break if best_max_value >= best_min_value
      end
    end
    if player_symbol == current_player
      score = best_max_value
    else
      score = best_min_value
    end
    weighted_move = WeightedMove.new(best_move, score)
    return weighted_move
  end
end

