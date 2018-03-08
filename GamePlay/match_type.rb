class MatchType
  attr_reader :player1_type, :player2_type

  def initialize(player1, player2)
    @player1_type = player1
    @player2_type = player2
  end
end
