require_relative '../Players/player_manager.rb'
require_relative '../Validators/player_symbol_validator.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

class GameBoard
  attr_reader :player_manager, :board

  def initialize(player_manager, board)
    raise NilReferenceError, "player_manager" if player_manager.nil?
    @player_manager = player_manager
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
end
