require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'

RSpec.describe "a match" do
  
  let(:matches) { MatchTypeManager.new }

  it "can be a Human vs a Human" do
    match = matches.get_match_type(1)
    player1_type = match.player1_type.selected_option
    player2_type = match.player2_type.selected_option
    expect(player1_type).to eq(:Human) 
    expect(player2_type).to eq(:Human)
  end

  it "can be a Human vs a Computer" do
    match = matches.get_match_type(2)
    player1_type = match.player1_type.selected_option
    player2_type = match.player2_type.selected_option
    expect(player1_type).to eq(:Human) 
    expect(player2_type).to eq(:Computer)
  end

  it "can be a Computer vs a Computer" do
    match = matches.get_match_type(3)
    player1_type = match.player1_type.selected_option
    player2_type = match.player2_type.selected_option
    expect(player1_type).to eq(:Computer) 
    expect(player2_type).to eq(:Computer)
  end
  
end

