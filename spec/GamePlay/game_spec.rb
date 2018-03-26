require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'

RSpec.describe "a game" do 

  it "has three matches available to play" do
    raise if match_manager.get_total_available_matches != 3
  end

  def match_manager
    MatchTypeManager.new
  end

  it "is against two players" do
    player1 = double()
    player2 = double()
    match = match_type(player1, player2)
    raise if match.player1_type.nil?
    raise if match.player2_type.nil?
  end

  def match_type(player1, player2)
    MatchType.new(player1, player2)
  end

end