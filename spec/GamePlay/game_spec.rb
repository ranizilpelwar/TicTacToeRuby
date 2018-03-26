require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'
require_relative '../../TicTacToeRuby.Core/Validators/game_over_validator.rb'
require_relative '../../TicTacToeRuby.Core/Validators/tie_game_validator.rb'
require_relative '../../TicTacToeRuby.Core/Validators/player_selection_validator.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_movement_manager.rb'
require_relative '../../TicTacToeRuby.Console/GamePlay/match_type_setup.rb'
# require_relative '../../TicTacToeRuby.Console/Output/console_writer.rb'
# require_relative '../../TicTacToeRuby.Console/Input/console_reader.rb'

RSpec.describe "a game" do 

  it "has three matches available to play" do
    raise if match_manager.get_total_available_matches != 3
  end

  it "allows the user to chose the game type" do
    writer = double("ConsoleWriter", :display_message => "")
    reader = double("ConsoleReader", :read_input => "1", :read_input_ignore_empty => "1")
    player1_type = double("PlayerType", :selected_option => :Human)
    player2_type = double("PlayerType", :selected_option => :Human)
    match = double("MatchType", :player1_type => player1_type, :player2_type => player2_type)
    player_type = double("PlayerType", )
    match_manager = double("MatchTypeManager", :get_total_available_matches => "1", :matches => [match], :valid? => true, :get_match_type => match)
    match_type = MatchTypeSetup.get_valid_match_type(writer, reader, match_manager)
    raise if match_type.nil?
  end

  it "is against two players" do
    player1 = double()
    player2 = double()
    match = match_type(player1, player2)
    raise if match.player1_type.nil?
    raise if match.player2_type.nil?
  end

  it "allows the user to choose which player goes first" do
    symbol1 = "X"
    symbol2 = "Y"
    selection = "X"
    raise if !PlayerSelectionValidator.valid?(selection, symbol1, symbol2)
  end

  it "can end in a win when a player has three squares in a row" do
    board = ["X", "X", "X", "4", "5", "6", "7", "8", "9"]
    raise if !GameOverValidator.game_over?(board)
  end

  it "can end in a win when a player has three squares in a column" do
    board = ["X", "2", "3", "X", "5", "6", "X", "8", "9"]
    raise if !GameOverValidator.game_over?(board)
  end

  it "can end in a win when a player has three squares diagonally" do
    board1 = ["X", "2", "3", "4", "X", "6", "7", "8", "X"]
    win_left_diagonal = GameOverValidator.game_over?(board1)
    board2 = ["1", "2", "X", "4", "X", "6", "X", "8", "9"]
    win_right_diagonal = GameOverValidator.game_over?(board2)
    raise if !win_left_diagonal && !win_right_diagonal
  end

  it "can end in a tie when neither player gets three squares consecutively on a board" do
    board = ["X", "X", "Y", "Y", "Y", "X", "X", "X", "Y"]
    raise if !TieGameValidator.tie_game?(board)
  end

  it "can store a player's last move" do
    match_type = 1
    player_number = 1
    updated_move = 4
    manager = movement_manager(match_type)
    stored_value = manager.update_last_move_for_player(player_number, updated_move)
    raise if manager.get_last_move_for_player(player_number) != updated_move
  end

  def match_manager
    MatchTypeManager.new
  end

  def match_type(player1, player2)
    MatchType.new(player1, player2)
  end

  def movement_manager(match_type)
    PlayerMovementManager.new(match_type)
  end
end