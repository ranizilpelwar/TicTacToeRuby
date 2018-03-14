require_relative '../Validators/player_symbol_validator.rb'

class GameOverValidator
  def self.game_over?(board)
    raise ArgumentError, "Cannot determine if game is over because provided board is nil." unless !board.nil?
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
    raise ArgumentError, "Cannot determine if player won because provided board is nil." unless !board.nil?
    raise ArgumentError, "Cannot determine if player won because provided player symbol is invalid." unless PlayerSymbolValidator.valid?(player_symbol)
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