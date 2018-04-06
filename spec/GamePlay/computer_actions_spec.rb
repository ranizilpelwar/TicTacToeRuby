require_relative '../../TicTacToeRuby.Core/GamePlay/computer_actions.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/game_board.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/computer_actions.rb'
require_relative '../../TicTacToeRuby.Core.UnitTests/Players/mock_player_manager.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/nil_reference_error.rb'
require_relative '../../TicTacToeRuby.Core/Exceptions/invalid_value_error.rb'

RSpec.describe "get best move" do
  let(:best_max_move) { -20000 }
  let(:best_min_move) {  20000 }

  def create_computer_actions(new_board)
    players = MockPlayerManager.new
    @game_board = GameBoard.new(players, new_board)
    @computer_actions = ComputerActions.new(@game_board)
  end

  it "raises a nil reference error when board is nil" do
    new_board = [ "X", "O", "X",
                  "X", "5", "O",
                  "O", "X", "X" ]
    create_computer_actions(new_board)
    expect { @computer_actions.get_best_move(nil, "X", 0, best_max_move, best_min_move) }.to raise_error(NilReferenceError)
  end

  it "raises an invalid value error when player symbol is a space character" do
    new_board = [ "X", "O", "X",
                  "X", "5", "O",
                  "O", "X", "X" ]
    create_computer_actions(new_board)
    expect { @computer_actions.get_best_move(new_board, " ", 0, best_max_move, best_min_move) }.to raise_error(InvalidValueError)
  end

  it "returns index of negative one when there are no next moves to make" do
    new_board = [ "X", "O", "X",
                  "X", "X", "O",
                  "O", "X", "X" ]
    create_computer_actions(new_board)
    expected_move_index = -1
    actual_move = @computer_actions.get_best_move(new_board, "X", 1, best_max_move, best_min_move)
    actual_move_index = actual_move.index
    expect(actual_move_index).to eq(expected_move_index)
  end  
  
  it "returns index of negative one when depth is zero" do
    new_board = [ "X", "O", "X",
                  "X", "5", "O",
                  "O", "X", "X" ]
    create_computer_actions(new_board)
    expected_move_index = -1
    actual_move = @computer_actions.get_best_move(new_board, "X", 0, best_max_move, best_min_move)
    actual_move_index = actual_move.index
    expect(actual_move_index).to eq(expected_move_index)
  end

  it "returns correct spot when one move results in a winning game for computer" do
    new_board = [ "X", "O", "X",
                  "X", "5", "O",
                  "O", "O", "X" ]
    create_computer_actions(new_board)
    expected_index = 4
    actual_move = @computer_actions.get_best_move(new_board, "O", 5, best_max_move, best_min_move)
    actual_index = actual_move.index
    expect(actual_index).to eq(expected_index)
  end

  it "returns correct spot when one move is left to play" do
    new_board = [ "X", "O", "X",
                  "X", "5", "O",
                  "O", "X", "X" ]
    create_computer_actions(new_board)
    expected_index = 4
    actual_move = @computer_actions.get_best_move(new_board, "O", 5, best_max_move, best_min_move)
    actual_index = actual_move.index
    expect(actual_index).to eq(expected_index)
  end

  shared_examples "multiple moves" do |scenario, board, player_symbol, expected_index|
    it "results in a win for scenario #{scenario}" do
      create_computer_actions(board)
      depth = 5
      actual_index = @computer_actions.get_best_move(board, player_symbol, depth, best_max_move, best_min_move).index
      expect(actual_index).to eq(expected_index)
    end
  end

  describe "multiple available moves" do
    include_examples "multiple moves", 1, ["X", "O", "3", "X", "5", "O", "O", "O", "X" ], "O", 4
    include_examples "multiple moves", 2, ["1", "O", "3", "4", "5", "O", "7", "O", "X" ], "O", 4
    include_examples "multiple moves", 3, ["1", "O", "3", "O", "5", "O", "7", "O", "X" ], "O", 4
    include_examples "multiple moves", 4, ["1", "X", "3", "X", "5", "O", "7", "X", "O" ], "O", 2
    include_examples "multiple moves", 5, ["1", "X", "3", "O", "5", "O", "O", "X", "9" ], "O", 4
    include_examples "multiple moves", 6, ["1", "X", "3", "X", "5", "6", "7", "O", "O" ], "O", 6
    include_examples "multiple moves", 7, ["1", "X", "O", "X", "5", "6", "7", "X", "O" ], "O", 5
    include_examples "multiple moves", 8, ["O", "2", "X", "4", "X", "6", "O", "8", "X" ], "O", 3
    include_examples "multiple moves", 9, ["O", "2", "O", "4", "5", "X", "7", "X", "9" ], "O", 1
    include_examples "multiple moves", 10,["O", "2", "3", "4", "O", "6", "7", "8", "9" ], "O", 8
    include_examples "multiple moves", 11,["1", "2", "O", "4", "5", "6", "O", "8", "9" ], "O", 4
  end

  shared_examples "blocking action" do |scenario, board, player_symbol, expected_index|
    it "is chosen correctly for scenario #{scenario}" do
      create_computer_actions(board)
      depth = 5
      actual_index = @computer_actions.get_best_move(board, player_symbol, depth, best_max_move, best_min_move).index
      expect(actual_index).to eq(expected_index)
    end
  end

  describe "blocking action" do
    include_examples "blocking action", 1, ["1", "X", "3", "X", "5", "O", "O", "X", "9" ], "O", 4
    include_examples "blocking action", 2, ["O", "X", "3", "4", "X", "6", "7", "8", "O" ], "O", 7
    include_examples "blocking action", 3, ["1", "2", "O", "4", "X", "6", "7", "X", "9" ], "O", 1
    include_examples "blocking action", 4, ["X", "2", "3", "4", "5", "6", "X", "8", "9" ], "O", 3
    include_examples "blocking action", 5, ["X", "2", "3", "4", "5", "6", "7", "8", "X" ], "O", 4
    include_examples "blocking action", 6, ["1", "2", "3", "4", "5", "6", "X", "8", "X" ], "O", 7
    include_examples "blocking action", 7, ["1", "2", "X", "4", "5", "6", "7", "8", "X" ], "O", 5
    include_examples "blocking action", 8, ["X", "2", "O", "4", "5", "6", "X", "8", "9" ], "O", 3
    include_examples "blocking action", 9, ["O", "X", "O", "X", "X", "O", "7", "O", "9" ], "X", 8
  end
end