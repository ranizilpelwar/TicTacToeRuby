require_relative '../Validators/player_symbol_validator.rb'

module GameOverValidator
  def self.game_over?(board)
    raise ArgumentError, MessageGenerator.argument_error("determine game_over", "board", "nil") if board.nil?
    result =  board[0] == board[1] && board[1] == board[2] ||
              board[3] == board[4] && board[4] == board[5] ||
              board[6] == board[7] && board[7] == board[8] ||
              board[0] == board[3] && board[3] == board[6] ||
              board[1] == board[4] && board[4] == board[7] ||
              board[2] == board[5] && board[5] == board[8] ||
              board[0] == board[4] && board[4] == board[8] ||
              board[2] == board[4] && board[4] == board[6];
  end

  def self.win_for_player?(player_symbol, board)
    raise ArgumentError, MessageGenerator.argument_error("determine win_for_player", "board", "nil") if board.nil?
    raise ArgumentError, MessageGenerator.argument_error("determine win_for_player", "player_symbol", "invalid") if !PlayerSymbolValidator.valid?(player_symbol)
    result =    (board[0] == player_symbol && board[1] == player_symbol && board[2] == player_symbol) ||
                (board[3] == player_symbol && board[4] == player_symbol && board[5] == player_symbol) ||
                (board[6] == player_symbol && board[7] == player_symbol && board[8] == player_symbol) ||
                (board[0] == player_symbol && board[3] == player_symbol && board[6] == player_symbol) ||
                (board[1] == player_symbol && board[4] == player_symbol && board[7] == player_symbol) ||
                (board[2] == player_symbol && board[5] == player_symbol && board[8] == player_symbol) ||
                (board[0] == player_symbol && board[4] == player_symbol && board[8] == player_symbol) ||
                (board[2] == player_symbol && board[4] == player_symbol && board[6] == player_symbol)
  end
end