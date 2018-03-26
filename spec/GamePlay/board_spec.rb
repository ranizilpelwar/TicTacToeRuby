require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'

RSpec.describe "a Tic Tac Toe board" do
  it "is a grid with nine squares" do
    raise if game_board.board.size != 9
  end

  it "has a number on each square"
  it "has the player's symbol on a square when a player selects it"
 
  def game_board 
    player_manager = double()
    GameBoard.new(player_manager, GameBoard.create_board)
  end
end