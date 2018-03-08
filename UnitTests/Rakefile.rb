task :run_tests do
  require_relative 'Players/tc_player_type.rb'
  ruby 'Players/tc_player_type.rb'
  ruby 'Players/tc_player_manager_initialization.rb'
  ruby 'Players/tc_player_manager.rb'
  ruby 'Players/tc_player.rb'
end