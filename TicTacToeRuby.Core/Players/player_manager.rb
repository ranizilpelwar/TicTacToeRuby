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
    next_player = @current_player.equals?(@player1) ? @player2 : @player1
  end

  # Returns the number of the player stored in Player Manager, where 1 represents player 1 and -1 indicates that the player could not be found.
  def get_player_number(player)
    raise ArgumentError, MessageGenerator.argument_error("get_player_number", "player", "nil") if player.nil?
    number = 
      if player.equals?(@player1) 
        1
      elsif player.equals?(@player2) 
        2
      else 
        -1
    end
  end
end