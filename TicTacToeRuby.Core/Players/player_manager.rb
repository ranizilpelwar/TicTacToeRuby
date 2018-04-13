require_relative '../../TicTacToeRuby.Core/Players/player.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

class PlayerManager

  attr_reader :player1, :player2, :current_player

  def initialize(player1, player2)
    raise NilReferenceError, "player1" if player1.nil?
    raise NilReferenceError, "player2" if player2.nil?
    raise InvalidValueError, "duplicate symbols" if player1.symbol.upcase == player2.symbol.upcase
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
    raise NilReferenceError, "player" if player.nil?
    number = 
    if player.equals?(@player1) 
      1
    elsif player.equals?(@player2) 
      2
    else 
      -1
    end
  end

  def player(player_number)
    player = 
    if player_number == 1
      player1
    elsif player_number == 2 
      player2
    else 
      raise InvalidValueError, "player_number"
    end
  end

  def symbol(player_number)
    player(player_number).symbol
  end

  def type(player_number)
    player(player_number).type.selected_option.to_s
  end
end