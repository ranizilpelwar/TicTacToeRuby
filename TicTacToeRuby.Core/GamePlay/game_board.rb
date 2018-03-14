require_relative '../Players/player_manager.rb'
require_relative '../Validators/player_symbol_validator.rb'

class GameBoard
  attr_reader :player_manager, :board

  def initialize(player_manager, board)
    raise ArgumentError, "Cannot create GameBoard with nil player_manager." unless player_manager != nil
    @player_manager = player_manager
    @board = board
  end

  def self.create_board
    board = []
    board << "1"
    board << "2"
    board << "3"
    board << "4"
    board << "5"
    board << "6"
    board << "7"
    board << "8"
    board << "9"
  end

  def update_board(index, player_symbol)
    raise ArgumentError, "Cannot update board with invalid player_symbol" unless PlayerSymbolValidator.valid?(player_symbol)
    raise ArgumentError, "Index provided cannot be greater than the last spot on the board." unless index < board.length
    raise ArgumentError, "Index provided cannot be less than the first spot on the board." unless index >= 0
    @board[index] = player_symbol
  end

  def revert_board(index)
    raise ArgumentError, "Index provided cannot be greater than the last spot on the board." unless index < board.length
    raise ArgumentError, "Index provided cannot be less than the first spot on the board." unless index >= 0
    tile = index + 1
    @board[index] = tile.to_s
  end
end
