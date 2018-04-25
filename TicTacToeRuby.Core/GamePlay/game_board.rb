require_relative '../Validators/player_symbol_validator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

class GameBoard
  attr_reader :board

  def initialize(board)
    raise NilReferenceError, "board" if board.nil?
    raise InvalidValueError, "board" if board.size == 0
    @board = board
  end

  def self.create_board
    board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def update_board(index, player_symbol)
    raise InvalidValueError, "player_symbol" if !PlayerSymbolValidator.valid?(player_symbol)
    raise InvalidValueError, "index" if index >= board.length || index < 0
    @board[index] = player_symbol
  end

  def revert_board(index)
    raise InvalidValueError, "index" if index >= board.length || index < 0 
    tile = index + 1
    @board[index] = tile.to_s
  end

  def tile(index)
    raise InvalidValueError, "index" if index >= board.length || index < 0
    board[index]
  end
end
