class PlayerMovementManager
  attr_reader :player1_last_move, :player2_last_move, :match_type

# Type of Match being played determines which player moves are reverted (one or both).
  def initialize(type_of_match)
    raise ArgumentError, 'Type of match is null' unless type_of_match != nil
    @player1_last_move = -1
    @player2_last_move = -1
    @match_type = type_of_match
  end

  def get_last_move_for_player(player_number)
    raise ArgumentError, "Given player number does not exist."
    unless player_number = 1 || player_number = 2
    end
  end  
end
