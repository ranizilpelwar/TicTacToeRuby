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
end