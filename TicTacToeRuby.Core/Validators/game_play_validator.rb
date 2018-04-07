require_relative '../GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core/Validators/available_spaces_validator.rb'
require_relative '../../TicTacToeRuby.Core/Validators/game_over_validator.rb'
require_relative '../../TicTacToeRuby.Core/Validators/player_symbol_validator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

module GamePlayValidator

  # Returns an array containing two elements:
  # 1) is_valid: True if the tile chosen on the board is a valid move that can be made in the game and false otherwise, and
  # 2) index_of_board: index on the board on which a move should be made. It is provided if is_valid is true. It is -1 otherwise.
  def self.evaluate_move(game_board, tile_on_board)
    raise NilReferenceError, "game_board" if game_board.nil?
    is_valid_move = false
    index_of_board = -1
    is_digit = AvailableSpacesValidator.digit?(tile_on_board)
    if is_digit
      board = game_board.board
      index_of_board = board.index(tile_on_board)
      is_valid_move = true if !index_of_board.nil?
    end
    result = generate_result(is_valid_move, index_of_board)
  end

  def self.generate_result(is_valid_move, index_of_board)
    result = Struct.new(:is_valid_move, :index_of_board).new(is_valid_move, index_of_board)
  end

  def self.winning_game?(player_symbol, board, available_spaces)
    raise NilReferenceError, "board" if board.nil?
    raise NilReferenceError, "available_spaces" if available_spaces.nil?
    raise InvalidValueError, "player_symbol" if !PlayerSymbolValidator.valid?(player_symbol)
    found_best_move = false
    winning_spot = -1
    temp_board = board.each {  }
    available_spaces.each do |current_spot| 
      temp_board[current_spot] = player_symbol
      if GameOverValidator.game_over?(temp_board)
        found_best_move = true
        winning_spot = current_spot
      else
        temp_board[current_spot] = current_spot.to_s
      end     
    end
    result = generate_result(found_best_move, winning_spot)
  end
end
