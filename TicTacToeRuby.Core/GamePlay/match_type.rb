class MatchType
  attr_reader :player1_type, :player2_type

  def initialize(player1_type, player2_type)
    @player1_type = player1_type
    @player2_type = player2_type
  end
end
