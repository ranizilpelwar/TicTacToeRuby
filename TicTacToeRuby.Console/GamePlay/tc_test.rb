require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative 'match_type_setup.rb'
puts "Testing the test scripts:"

writer = ConsoleWriter.new
match_type_manager = MatchTypeManager.new
MatchTypeSetup.prompt_for_match_type_selection(writer, match_type_manager)





