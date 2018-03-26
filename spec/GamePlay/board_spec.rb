require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core/Validators/available_spaces_validator.rb'

RSpec.describe "a Tic Tac Toe board" do
  before(:each) do
    @game = game_board
  end

  it "is a grid with nine squares" do
    raise if grid.size != 9
  end

  it "has a number on each square" do
    grid.each do |square|
      raise if !digit?(square)
    end
  end

  it "has the player's symbol on a square when a player selects it" do
    index = 4
    symbol = "X"
    select_square(index, symbol)
    grid_value = grid[index]
    raise "grid_value = #{grid_value} but expected it to be #{symbol}" if grid_value != symbol
  end
 
  def game_board 
    player_manager = double()
    GameBoard.new(player_manager, GameBoard.create_board)
  end
  
  def grid 
    @game.board
  end

  def digit?(input)
    AvailableSpacesValidator.digit?(input)
  end

  def select_square(index_on_grid, symbol)
    @game.update_board(index_on_grid, symbol)
  end
end