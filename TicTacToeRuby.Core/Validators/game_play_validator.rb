require_relative '../GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core/Validators/available_spaces_validator.rb'
require 'forwardable'
require 'tuples'

class GamePlayValidator

  # Returns an array containing two elements:
  # 1) is_valid: True if the tile chosen on the board is a valid move that can be made in the game and false otherwise, and
  # 2) index_of_board: index on the board on which a move should be made. It is provided if is_valid is true. It is -1 otherwise.
  def self.evaluate_move(game_board, tile_on_board)
    raise ArgumentError, "Cannot evaluate move because provided game_board is nil." unless !game_board.nil?
    is_valid_move = false
    index_of_board = -1
    is_digit = AvailableSpacesValidator.digit?(tile_on_board)
    if is_digit
      board = game_board.board
      index_of_board = board.index(tile_on_board)
      if !index_of_board.nil?
        is_valid_move = true
      end
    end

    result = generate_result(is_valid_move, index_of_board)
  end

  def self.generate_result(is_valid_move, index_of_board)
    # result = []
    # result << is_valid_move
    # result << index_of_board

    result = Pair.new(is_valid_move, index_of_board)
  end
end
