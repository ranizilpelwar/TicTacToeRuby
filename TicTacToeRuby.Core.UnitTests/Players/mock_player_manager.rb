require_relative '../../TicTacToeRuby.Core/Players/player_manager.rb'
require_relative '../../TicTacToeRuby.Core/Players/player.rb'

class MockPlayerManager
  attr_reader :player_manager, :player1, :player2, :current_player

  def initialize
    # setup symbols for each player
      symbol_one = "O"
      symbol_two = "X"

      # get types for each player
      player1_type = :Computer
      player2_type = :Human

      # create the players
      @player1 = Player.new(player1_type, symbol_one)
      @player2 = Player.new(player2_type, symbol_two)
      @current_player = @player1
      @player_manager = PlayerManager.new(@player1, @player2)
  end

  def update_current_player
    @current_player = get_next_player
  end

  def get_next_player
    next_player = @current_player.equals?(@player1) ? @player2 : @player1
  end

  def get_player_number(player)
    raise ArgumentError, "Provided player cannot be nil." if player.nil?
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