require_relative '../../TicTacToeRuby.Core/GamePlay/match_type_manager.rb'
require_relative '../../TicTacToeRuby.Core/GamePlay/match_type.rb'
require_relative '../../TicTacToeRuby.Core/Players/player_type.rb'
require_relative 'match_type_setup.rb'
require_relative 'game_play_setup.rb'
puts "Testing the test scripts:"

writer = ConsoleWriter.new
reader = ConsoleReader.new
# match_type_manager = MatchTypeManager.new
# #MatchTypeSetup.prompt_for_match_type_selection(writer, match_type_manager)
# MatchTypeSetup.get_valid_match_type(writer, reader, match_type_manager)

GamePlaySetup.new(writer, reader)


