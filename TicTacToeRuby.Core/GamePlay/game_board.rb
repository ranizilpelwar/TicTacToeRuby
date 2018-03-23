require_relative '../Players/player_manager.rb'
require_relative '../Validators/player_symbol_validator.rb'

class GameBoard
  attr_reader :player_manager, :board

  def initialize(player_manager, board)
    raise ArgumentError, "Cannot create GameBoard with nil player_manager." if player_manager == nil
    @player_manager = player_manager
    @board = board
  end

  def self.create_board
    board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def update_board(index, player_symbol)
    raise ArgumentError, "Cannot update board with invalid player_symbol" if !PlayerSymbolValidator.valid?(player_symbol)
    raise ArgumentError, "Index provided cannot be greater than the largest index on the board." if index >= board.length
    raise ArgumentError, "Index provided cannot be less than the first spot on the board." if index < 0
    @board[index] = player_symbol
  end

  def revert_board(index)
    raise ArgumentError, "Index provided cannot be greater than the largest index on the board." if index >= board.length
    raise ArgumentError, "Index provided cannot be less than the first spot on the board." if index < 0
    tile = index + 1
    @board[index] = tile.to_s
  end
end
