require_relative '../Players/player_manager.rb'
require_relative '../Validators/player_symbol_validator.rb'

class GameBoard
  attr_reader :player_manager, :board

  def initialize(player_manager, board)
    raise ArgumentError, MessageGenerator.argument_error("initialize", "player_manager", "nil") if player_manager.nil?
    @player_manager = player_manager
    @board = board
  end

  def self.create_board
    board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def update_board(index, player_symbol)
    raise ArgumentError, MessageGenerator.argument_error("update_board", "player_symbol", "invalid") if !PlayerSymbolValidator.valid?(player_symbol)
    raise ArgumentError, MessageGenerator.argument_error("update_board", "index", "greater or equal to board length") if index >= board.length
    raise ArgumentError, MessageGenerator.argument_error("update_board", "index", "less than the first spot on the board") if index < 0
    @board[index] = player_symbol
  end

  def revert_board(index)
    raise ArgumentError, MessageGenerator.argument_error("revert_board", "index", "greater than the largest index on the board") if index >= board.length
    raise ArgumentError, MessageGenerator.argument_error("revert_board", "index", "less than the first spot on the board") if index < 0
    tile = index + 1
    @board[index] = tile.to_s
  end
end
