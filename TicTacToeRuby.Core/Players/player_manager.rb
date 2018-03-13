class PlayerManager

  attr_reader :player1, :player2, :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def update_current_player
    @current_player = get_next_player
  end

  def get_next_player
    next_player = current_player.equals?(player1) ? player2 : player1
  end
end