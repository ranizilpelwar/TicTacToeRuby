require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'

RSpec.describe "a match" do
  
  before(:each) do
    @matches = match_manager
  end


  it "can be a Human vs a Human" do
    match = @matches.get_match_type(1)
    player1_type = match.player1_type.selected_option
    player2_type = match.player2_type.selected_option
    message = "Expected first match to be a Human vs Human but it was #{player1_type} vs #{player2_type}"
    raise message if player1_type != :Human && player2_type != :Human 
  end

  it "can be a Human vs a Computer" do
    match = @matches.get_match_type(2)
    player1_type = match.player1_type.selected_option
    player2_type = match.player2_type.selected_option
    message = "Expected second match to be a Human vs Computer but it was #{player1_type} vs #{player2_type}"
    raise message if player1_type != :Human && player2_type != :Computer
  end

  it "can be a Computer vs a Computer" do
    match = @matches.get_match_type(3)
    player1_type = match.player1_type.selected_option
    player2_type = match.player2_type.selected_option
    message = "Expected second match to be a Computer vs Computer but it was #{player1_type} vs #{player2_type}"
    raise message if player1_type != :Computer && player2_type != :Computer
  end
  
  def match_manager
    MatchTypeManager.new
  end
end

