task :run_tests do
  require_relative 'TicTacToeRuby.Core.UnitTests/Players/tc_player_type.rb'
  ruby 'TicTacToeRuby.Core.UnitTests/Players/tc_player_type.rb'
  ruby 'TicTacToeRuby.Core.UnitTests/Players/tc_player_manager_initialization.rb'
  ruby 'TicTacToeRuby.Core.UnitTests/Players/tc_player_manager.rb'
  ruby 'TicTacToeRuby.Core.UnitTests/Players/tc_player.rb'
  ruby 'TicTacToeRuby.Core.UnitTests/Players/tc_player_movement_manager.rb'
  ruby 'TicTacToeRuby.Core.UnitTests/GamePlay/tc_match_type.rb'
  ruby 'TicTacToeRuby.Core.UnitTests/GamePlay/tc_match_type_manager.rb'
  ruby 'TicTacToeRuby.Core.UnitTests/GamePlay/tc_game_board.rb'
  ruby 'TicTacToeRuby.Core.UnitTests/GamePlay/tc_computer_actions.rb'
end
